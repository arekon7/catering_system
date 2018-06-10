<?php

namespace App\Http\Controllers;
use App\User;
use App\Role;
use App\Company;
use App\CompanyImage;
use App\Food_category;
use App\Menu_record;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\File;
use App\Http\Requests\EditImageRequest;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Log;
use App\Order;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation;

class FoodMenuCtrl extends Controller
{
    
    public function showFoodMenu($company_id) {  
        
        $company = DB::table('companies')->where('id', $company_id)->first();
        
        if(count($company) < 1){
            flash('Error!', 'danger');
            return redirect()->back();
        }
        $menu = DB::table('menu')->where('company_id', $company_id)->get();
        $food_categories = DB::table('food_categories')->where('company_id', $company_id)->get();
        
        return view('food_menu.food_menu', ['menu' => $menu, 'food_categories' => $food_categories, 'company' => $company]);
    }
    
    public function createOrder(Request $request) {

    if($request->ajax()) {
        $data = $request->all();
//        var_dump($data);
        if (Auth::check()){
            $orderer_id = Auth::id();
        } else {
            $orderer_id = 0;
//            return '';
        }
      
        DB::beginTransaction();
//        $order = $data->order;
	foreach($data as $order){
            foreach ($order as $order_item){
//                var_dump($order_item);
                $menu_item_info = DB::table('menu')->where([
                    ['company_id', '=' , $order_item['c_id']],
                    ['id', '=', $order_item['food_id']],   
                    ])->first();

                $order = new Order();
                $order->company_id = $order_item['c_id'];
                $order->menu_item_id = $order_item['food_id'];
                $order->quantity = $order_item['food_quantity'];
                $order->price = $order->quantity * $menu_item_info->price;

                $order->orderer_id = $orderer_id;

                $order->save();
                $order_id = $order->id;   
            }
        }
        
        DB::commit();
      
      
      return response()->json(array('code'=>200, 'status' => 'Ajax ok', 'data' => $data,));
    }
    
    return response()->json(array('code'=>400, 'status' => 'Ajax Error',));

    }
    
    public function showOrders(){
        
        if(!Auth::user()->hasRole('Company')){ return redirect()->route('main'); }
        $company_id = Session::get('cmp_mng_id');
        if(!$company_id){ 
            flash('You have no company! Create company first to access this feature. <br> Go to <b>Catering companies -> My comapanies -> Create new company</b>', 'info');
            return redirect()->back();
        }
        
        $orders = DB::select('SELECT 
                                o.id,
                                o.quantity,
                                o.price,
                                o.created_at,
                                o.status,
                                m.item,
                                fc.category,
                                u.first_name,
                                u.last_name,
                                u.email,
                                u.tel_no
                                FROM orders AS o
                                LEFT JOIN menu AS m ON m.id = o.menu_item_id
                                LEFT JOIN food_categories AS fc ON fc.id = m.category_id
                                LEFT JOIN companies AS c ON c.id = o.company_id
                                LEFT JOIN users AS u ON u.id = o.orderer_id
                                WHERE c.id = ?', [$company_id]);

        return view('show.show_orders', ['orders' => $orders]);
        
    }
    
     public function showOrdersUser(){
        
        $user_id = Auth::id();
        if(!$user_id){ return 'Error loading your info!'; }
        
        $orders = DB::select('SELECT 
                                o.id,
                                o.company_id,
                                o.menu_item_id,
                                o.orderer_id,
                                o.quantity,
                                o.created_at,
                                o.updated_at,
                                o.price,
                                m.category_id,
                                m.item,
                                m.description,
                                fc.category,
                                c.co_name,
                                c.address,
                                c.tel_no,
                                o.status
                            FROM orders AS o

                            LEFT JOIN menu AS m ON m.company_id = o.company_id
                            LEFT JOIN food_categories AS fc ON fc.id = m.category_id
                            LEFT JOIN companies AS c ON c.id = o.company_id

                            WHERE o.orderer_id = ? AND
                                  m.id = o.menu_item_id
                            ORDER BY o.id DESC', 
                            [$user_id]);
        
        return view('show.show_orders_user', ['orders' => $orders]);
        
    }
    
    public function showAllOrdersAdmin(){
        
        
        $orders = DB::select('SELECT 
                                o.id,
                                o.company_id,
                                o.menu_item_id,
                                o.orderer_id,
                                o.quantity,
                                o.created_at,
                                o.status,
                                m.category_id,
                                m.item,
                                m.description,
                                fc.category,
                                c.co_name,
                                c.address,
                                c.tel_no,
                                u.first_name,
                                u.last_name,
                                u.email
                            FROM orders AS o

                            LEFT JOIN menu AS m ON m.company_id = o.company_id
                            LEFT JOIN food_categories AS fc ON fc.id = m.category_id
                            LEFT JOIN companies AS c ON c.id = o.company_id
                            LEFT JOIN users AS u ON u.id = o.orderer_id

                            WHERE m.id = o.menu_item_id');
        
        return view('show.show_orders_admin', ['orders' => $orders]);
        
    }
    
    public function showCreateFoodCat() {
        return view('food_menu.create_category');
    }
    
    public function createFoodCategory(Request $request) {
        if($request->ajax()) {
            $data = $request->all();

            if(!Auth::user()->hasRole('Company')){ return redirect()->route('main'); }
            $company_id = Session::get('cmp_mng_id');
            $user_id = Auth::id();
            if(!$company_id){ 
                flash('You have no company! Create company first to access this feature. <br> Go to <b>Catering companies -> My comapanies -> Create new company</b>', 'info');
                return redirect()->route('main');
            }
            
            DB::beginTransaction();

            $food_category = new Food_category();
            $food_category->category = $data['food_category'];
            $food_category->company_id = $company_id;
          
            $food_category->save();
            $food_category_id = $food_category->id; 
            
            DB::commit();

            flash('Successfully created!', 'success');
            $route = route('food_category_management');
            return response()->json(array('code'=>200, 'status' => 'Ajax ok, id=' + $food_category_id, 'data' => $data, 'route' => $route)); 
            
        }  
        
        
        return response()->json(array('code'=>400, 'status' => 'Ajax Error',));
        

    }
    
    public function foodCatMngmnt() {
        $company_id = Session::get('cmp_mng_id');
        $categories = DB::table('food_categories')->where('company_id', $company_id)->get();
        return view('food_menu.show_cat_mngmnt', ['categories' => $categories]);
    }
    
    public function createMenuEntry_show() {
        $company_id = Session::get('cmp_mng_id');
        $categories = DB::table('food_categories')->where('company_id', $company_id)->get();
        
        if(count($categories) < 1){ 
            flash("You should have at least one category to create menu item! <br> Go to <b>Category management</b> and create one! ",'info');
            return redirect()->back();
        }
        
        return view('food_menu.create_menu_item', ['categories' => $categories]);
    }
    
    public function createMenuEntry(Request $request) {
        
        $company_id = Session::get('cmp_mng_id');
        
        $menu_record = new Menu_record([
            'company_id'    =>  $company_id,
            'category_id'   =>  $request->get('category'),
            'item'   =>  $request->get('item_name'), 
            'description'   =>  $request->get('description'), 
            'price'   =>  $request->get('item_price'), 
            
        ]);
        
        DB::beginTransaction();
            $menu_record->save();
        DB::commit(); 
        
        flash('Successfully created!', 'success');
        return redirect()->route('menu_management');
            
    }
    
    public function showMenuManagement() {
        if(!Auth::user()->hasRole('Company')){ return redirect()->route('main'); }
        $company_id = Session::get('cmp_mng_id');
        if(!$company_id){ 
            flash('You have no company! Create company first to access this feature. <br> Go to <b>Catering companies -> My comapanies -> Create new company</b>', 'info');
            return redirect()->route('main');
        }
        
        $menu = DB::select('
                SELECT m.id, m.company_id, m.item, m.description, c.category, m.price, m.created_at, m.updated_at
                FROM menu AS m
                LEFT JOIN food_categories AS c ON m.category_id = c.id
                WHERE m.company_id = ?
                ORDER BY m. item', [$company_id]);
        
        return view('show.show_menu_management', ['menu' => $menu]); 
    }
    
    public function editMenuItem($id) {
        
        $company_id = Session::get('cmp_mng_id');
        $categories = DB::table('food_categories')->where('company_id', $company_id)->get();
        $menu_item = DB::table('menu')->where([
                        ['id', '=', $id], 
                        ['company_id', '=', $company_id] 
                        ])->first();
        
        if(count($menu_item) < 1){
            flash('Error!', 'danger');
            return redirect()->back();
        }
        
        return view('food_menu.edit_menu_item', ['categories' => $categories, 'menu_item' => $menu_item]);
     
    }   
    
    public function update_menu_item(Request $request) {
        if($request->ajax()) {
            $data = $request->all();
            
            $this->validate($request, [
                'item_name' => 'required|max:255',
                'item_price' => 'required',
            ]);

            $company_id = Session::get('cmp_mng_id');
            $user_id = Auth::id();
            if(!$company_id){ 
                flash('You have no company! Create company first to access this feature. <br> Go to <b>Catering companies -> My comapanies -> Create new company</b>', 'info');
                return redirect()->route('main');
            }
            
//            var_dump($data);
//            dd($data);
            
            DB::beginTransaction();

            $menu_item = Menu_record::findOrFail($data['item_id']);
            
            $menu_item->item = $data['item_name'];
            $menu_item->category_id = $data['category'];
            $menu_item->description = $data['description'];
            $menu_item->price = $data['item_price'];
            
            $menu_item->save();
            
            $menu_item_id = $menu_item->id;
            
            DB::commit();

            flash('Successfully updated!', 'success');
            return route('menu_management');
//            return response()->json(array('code'=>200, 'status' => 'Ajax ok, id=' + $menu_item_id, 'data' => $data,)); 
            
        }
        return response()->json(array('code'=>400, 'status' => 'Ajax Error'));  
    }   
    
    public function getEditCategory($id) {
        
        $category = DB::table('food_categories')->where('id', $id)->first();
        
        if(count($category) < 1){
            flash('No such company!', 'danger');
            return redirect()->back();
        }
        
        return view('food_menu.edit_category', ['category' => $category]);
     
    } 
    
     public function update_category($cat_id, Request $request) {
        
           
            $this->validate($request, [
                'category' => 'required|max:20',
            ]);

            $company_id = Session::get('cmp_mng_id');
            $user_id = Auth::id();
            if(!$company_id){ 
                flash('You have no company! Create company first to access this feature. <br> Go to <b>Catering companies -> My comapanies -> Create new company</b>', 'info');
                return redirect()->route('main');
            }
            
//            var_dump($data);
//            dd($data);
            
            DB::beginTransaction();

            $category = Food_category::findOrFail($cat_id);
            $category->category = $request['category'];
            $category->save();
            
            DB::commit();

            flash('Successfully updated!', 'success');
            return redirect()->route('food_category_management');
     }  
    
    
    public function deleteMenuItem($id) {
        DB::table('menu')->where('id', $id)->delete();
        flash('Successfully deleted!', 'success');
        return redirect()->route('menu_management');
    }
    
    public function deleteFoodCategory($id) {
        DB::table('food_categories')->where('id', $id)->delete();
        
        flash('Successfully deleted!', 'success');
        return redirect()->route('food_category_management');
    }
    
    public function deleteOrder() {
        if($request->ajax()) {
            $data = $request->all();
            
            $order = Order::find($data['order_id']);
            $order->delete();
        
            return response()->json(array('code'=>200, 'status' => ' Ajax ok, deleted'));
        }
        return response()->json(array('code'=>400, 'status' => ' Ajax Request Error',));
        
    }
    
}