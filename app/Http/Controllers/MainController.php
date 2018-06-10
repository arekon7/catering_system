<?php

namespace App\Http\Controllers;
use App\User;
use App\Role;
use App\Company;
use App\CompanyImage;
use App\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\File;
use App\Http\Requests\EditImageRequest;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Database\QueryException;


class MainController extends Controller
{
    public function getIndex()
    {
        return view('index');
    }
    
    public function showCompanies(Request $request)
    {
        $companies = DB::select('SELECT * from companies c, company_images ci WHERE c.main_pht = ci.image_no AND  c.id = ci.company_id ORDER BY c.id DESC');  
        return view('show_companies', ['companies' => $companies]);
        
    }
    
    public function showCompany($id) {
        
        $company = DB::table('companies')->where('id', $id)->first();
        
        if(empty($company)){
            flash('No such company!', 'danger');
            return redirect()->back();
        }
        
        $images = DB::table('company_images')->where('company_id', $id)->get();
        
        return view('show_company', ['company' => $company, 'images' => $images]);
    }
    
    public function getEditCompany($id){
        
        $company = Company::findOrFail($id);
        $images = DB::table('company_images')->where('company_id', $id)->get();
        
       return view('edit_company', ['company'=>$company, 'images'=>$images]);
       
    }
    
    public function updateCompany($id, Request $request){
        
        $company = Company::findOrFail($id);
        
//        $this->validate($request, [
//	 'co_name' => 'required|unique:companies|max:100',
//	 'co_email' => 'required|unique:companies',
//	 'web_p' => 'unique:companies|max:100',
//	 'tel_no' => 'max:33|regex:/^(\+)[0-9]{11}$/',
//         'town' => 'required'
//            ]);
        
        $company = Company::findOrFail($id);
        $images = DB::table('company_images')->where('company_id', $id)->get();
        
        $company->co_name = $request['co_name'];
        $company->resp_person = $request['resp_person'];
        $company->web_p = $request['web_p'];
        $company->tel_no = $request['tel_no'];
        $company->address = $request['address'];
        $company->town = $request['town'];
        $company->wh_from = $request['wh_from'];
        $company->wh_to = $request['wh_to'];
        $company->main_pht = $request['main_pht'];        
        $company->notes = $request['notes'];        
        $company->save();
        
        
        $destinationFolder = '/imgs/companies/';
        $destinationThumbnail = '/imgs/companies/thumbnails/';
        $n_imgs = DB::table('company_images')->where('company_id', $id)->count();
        $q = $n_imgs + 1;
        $img_q = $request['img_q'];
        
        for($q ; $q <= $img_q ; $q++){
            
            if($request->file('image'.$q) !== null){
                
                $image_name = str_random(20);
                $companyImage1 = new CompanyImage([
                    'image_name'        => $image_name.'_' . $q,
                    'image_path'        => $destinationFolder,
                    'image_extension'   => $request->file('image'.$q)->getClientOriginalExtension(),

                ]);
                $companyImage1->company_id = $id;
                $companyImage1->image_no = $q;
                $companyImage1->save();

                $file_1 = Input::file('image' . $q);
                $imageName_1 = $companyImage1->image_name;
                $extension_1 = $request->file('image' . $q)->getClientOriginalExtension();
                $image_1 = Image::make($file_1->getRealPath());
                $image_1->save(public_path() . $destinationFolder . $imageName_1 . '.' . $extension_1)
                   ->resize(180, 100)
                   // ->greyscale()
                   ->save(public_path() . $destinationThumbnail . 'thumb-' . $imageName_1 . '.' . $extension_1);
            }
        }
        
        
        flash()->success('Company info edited!');
        return redirect()->back();
        
    }
    
    public function deleteCompany($id) {
        
        if(!Auth::user()->hasRole('Admin')){
            $check_cmp = DB::table('companies')->where([['user_id', '=', Auth::id()], ['id', '=', $id]])->count();
            if($check_cmp < 1){
                flash('Error! This is not your company!', 'danger');
                return redirect()->back();
            }
        }
        
        $company = Company::findOrFail($id);
        if(empty($company)){
            flash('Error! This is not your company!', 'danger');
                return redirect()->back();
        }
        $images = DB::table('company_images')->where('company_id', $id)->get();
        
        try {
            Company::destroy($id);
            
        } catch(QueryException $ex){
            flash('Error! There is table schemas or menu items associated with this company, delete them first!','danger');
            return redirect()->back();
        }
        
        $deletedCmpImages = CompanyImage::where('company_id', $id)->delete();
            foreach ($images as $image){
            File::delete(public_path() . $image->image_path . 
                                        $image->image_name . '.' . 
                                        $image->image_extension);
            }
        
        flash()->success('Company deleted!');
        return redirect()->back();
        
    }
    
    public function showProfile() {
        
        $user_id = Auth::id();
        $user = DB::table('users')->where('id', $user_id)->first();

        return view('edit_profile', ['user' => $user]);
        
    }
    
    public function updateProfile($id, Request $request){
        
        
        $this->validate($request, [
             'email' => 'required||email',
             'first_name' => 'required|regex:/^[a-zA-ZĄČĘĖĮŠŲŪąčęėįšųū]+$/u|max:50',
             'last_name' => 'required|regex:/^[a-zA-ZĄČĘĖĮŠŲŪąčęėįšųū]+$/u|max:50',
             'tel_no' => 'required|max:33|regex:/^(\+)[0-9]{11}$/',
         ]);
        
        
        $user = User::findOrFail($id);
        $company = Company::where('user_id', $id)->first();
        
        $user->first_name = $request['first_name'];
        $user->last_name = $request['last_name'];
        $user->email = $request['email'];
        $user->tel_no = $request['tel_no'];
        $user->acc_type = $request['acc_type'];
        $user->save();
        
        $user->roles()->detach();
        
        
        if($user->acc_type == 1){
            $user->roles()->attach(Role::where('name', 'Company')->first());
        } else {
            $user->roles()->attach(Role::where('name', 'User')->first());
        }
 
        flash()->success('Profile info edited!');
        return redirect()->action('MainController@showProfile', [$id]);
        
    }
    
    
    public function showAllMyCompanies() {
        
        $user_id = Auth::id();
        if(!$user_id){ return 'Error loading your info!'; }
        
        if(!Auth::user()->hasRole('Company')){
            return 'Error loading your info!';
        }
        
        $companies =  DB::select('SELECT *
                                    FROM companies c, company_images ci
                                    WHERE c.main_pht = ci.image_no AND c.id = ci.company_id AND c.user_id = ?
                                    ORDER BY c.id DESC', 
                                [$user_id]); 
        
        return view('show.show_all_my_companies', ['companies' => $companies]);
    
    }
    
    public function getEditMyCompany($id){
        
        if (!(DB::table('companies')->where([ ['user_id', '=' , Auth::id()], ['id', '=', $id] ])->count() > 0)) {
            flash('This is not your company! <br> Error loading your info!', 'danger');
            return redirect()->back();
        }
        $company = Company::findOrFail($id);
        $images = DB::table('company_images')->where('company_id', $id)->get();
        
       return view('edit_company', ['company'=>$company, 'images'=>$images]);
       
    }
    
    public function getCreateCompany(){
       return view('create.create_company');
    }
    
    public function postCreateCompany(Request $request){
        
        if(!Auth::id()){ return 'Log in as company'; }
        
        $user_id = Auth::id();
        
        $this->validate($request, [
	 'co_name' => 'required|unique:companies|max:100',
	 'co_email' => 'required|unique:companies|max:100|email',
	 'web_p' => 'unique:companies|max:100',
	 'tel_no' => 'max:33|regex:/^(\+)[0-9]{11}$/',
         'town' => 'required'
            ]);
        
        DB::beginTransaction();
                
        $company = new Company;
        $company->user_id = $user_id;
        $company->co_name = $request['co_name'];
        $company->co_email = $request['co_email'];
        $company->resp_person = $request['resp_person'];
        $company->web_p = $request['web_p'];
        $company->tel_no = $request['tel_no'];
        $company->address = $request['address'];
        $company->town = $request['town'];
        $company->wh_from = $request['wh_from'];
        $company->wh_to = $request['wh_to'];
        $company->main_pht = $request['main_pht'] != NULL ? $request['main_pht'] : 1;        
        $company->notes = $request['notes'];        
        $company->save();

        $company_id = $company->id;
        //dd($company_id);

        $destinationFolder = '/imgs/companies/';
        $destinationThumbnail = '/imgs/companies/thumbnails/';
        
        $img_q = $request['img_q']; 
        
        Log::info($img_q);
        
        if($request->file('image1') == null){      
            $companyImage1 = new CompanyImage([
                    'image_name'        => 'no_image',
                    'image_path'        => '/imgs/',
                    'image_extension'   => 'jpg',
                ]);
            
            $companyImage1->company_id = $company_id;
            $companyImage1->image_no = 1;
            $companyImage1->save();
        } 
        
        $set_main_pht = 0;
        for($q = 1; $q <= $img_q; $q++){
            
            if($request->file('image'.$q) !== null){
                
                if($set_main_pht == 0){
                    $company->main_pht = $q;        
                    $company->save();
                    $set_main_pht = 1;
                }
                
                $image_name = str_random(20);
                $companyImage1 = new CompanyImage([
                    'image_name'        => $image_name.'_' . $q,
                    'image_path'        => $destinationFolder,
                    'image_extension'   => $request->file('image'.$q)->getClientOriginalExtension(),

                ]);
                $companyImage1->company_id = $company_id;
                $companyImage1->image_no = $q;
                $companyImage1->save();

                $file_1 = Input::file('image' . $q);
                $imageName_1 = $companyImage1->image_name;
                $extension_1 = $request->file('image' . $q)->getClientOriginalExtension();
                $image_1 = Image::make($file_1->getRealPath());
                $image_1->save(public_path() . $destinationFolder . $imageName_1 . '.' . $extension_1)
                   ->resize(180, 100)
                   // ->greyscale()
                   ->save(public_path() . $destinationThumbnail . 'thumb-' . $imageName_1 . '.' . $extension_1);
            }
        }
            
            DB::commit();
        
        if (Auth::user()->hasRole('Company')) {    // Check if user is logged in
            $request->session()->put('cmp_mng_id', $company->id);
            $request->session()->put('cmp_mng_name', $company->co_name);
            flash()->success('New company branch <b>' . $company->co_name . ' </b> created! <br> You are now managing it.');
            return redirect('show_all_my_companies');
        } else {
            flash()->success('New company <b>' . $company->co_name . ' </b> created!');
            return redirect()->route('main');
        }
        
    }
    
    public function deletePhoto($id) {
        
            $image = DB::table('company_images')->where('id', $id)->first();
            DB::table('company_images')->where('id', $id)->delete();
            
            File::delete(public_path() . $image->image_path . 
                                        $image->image_name . '.' . 
                                        $image->image_extension);
            
            flash('Image deleted', 'info');
            return redirect()->back();
    }
    
    
     public function show_chooseCmpMng() {
        
          $user_id = Auth::id();
          $companies = DB::table('companies')->where('user_id', $user_id)->get();
          
          return view('show.show_choose_cmp_mng', ['companies' => $companies]);
    }
    
    public function chooseCmpMng($cmp_id, Request $request) {
        
           $user_id = Auth::id();
           $check_cmp = DB::table('companies')->where([['id', '=', $cmp_id], ['user_id', '=', $user_id]])->get();
           if(count($check_cmp) < 1){ 
               flash('Error! Not your company!', 'danger');
               return redirect()->back();
           }
           
           $request->session()->put('cmp_mng_id', $cmp_id);
           $request->session()->put('cmp_mng_name', $check_cmp[0]->co_name);
          
           $data = $request->session()->all();
           
          flash('Success. You are now managing <b>'. $check_cmp[0]->co_name, 'success');
          return redirect()->back();
    }
    
    public function showSpecTownCmp($town){
        
//        $companies = DB::table('companies')->where('town', $town)->get();
        $companies = DB::select('SELECT * from companies c, company_images ci WHERE c.main_pht = ci.image_no AND  c.id = ci.company_id AND c.town = ? ORDER BY c.id DESC', [$town]);  
        return view('show_companies', ['companies' => $companies]);
        
    }
    
    public function changeOrderStatus(Request $request) {
        
        if($request->ajax()) {
            $data = $request->all();
            
            $order_old = DB::table('orders')->where('id', $data['order_id'] )->first();

        if($order_old->status == 0) { $current_stauts = 1; }
            else { $current_stauts = 0; }

            $order = Order::find($data['order_id']);
            $order->status = $current_stauts;
            $order->save();
            
            if($current_stauts == 0) {$order_status = 'Active'; }
            elseif($current_stauts == 1){ $order_status = 'Completed'; };
        
            return response()->json(array('code'=>200, 'status' => ' Ajax ok', 'order_status' => $order_status));
        }
        return response()->json(array('code'=>400, 'status' => ' Ajax Request Error',));
        
        
    }
    
    public function deleteOrder(Request $request) {
        if($request->ajax()) {
            $data = $request->all();
            
            $order = Order::find($data['order_id']);
            $order->delete();
        
            return response()->json(array('code'=>200, 'status' => ' Ajax ok, deleted'));
        }
        return response()->json(array('code'=>400, 'status' => ' Ajax Request Error',));
    }
    
    
    
   
}
    
    
