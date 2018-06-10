<?php

namespace App\Http\Controllers;
use App\User;
use App\Role;
use App\Company;
use App\CompanyImage;
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
use App\Table_schema;
use Illuminate\Support\Facades\Auth;
use App\Table_booking;
use Illuminate\Database\QueryException;


class TablesCtrl extends Controller
{
    
    public function createTableMap() {
        
        if(!Auth::user()->hasRole('Company')){ return redirect()->route('main'); }
            $company_id = Session::get('cmp_mng_id');
            $user_id = Auth::id();
            if(!$company_id){ 
                flash('You have no company! Create company first to access this feature. <br> Go to <b>Catering companies -> My comapanies -> Create new company</b>', 'info');
                return redirect()->route('main');
        }

        return view('tables.create_schema');
        
    }
    
    public function createTableSchema(Request $request){
        
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

            $table_schema = new Table_schema();
            $table_schema->table_coord = $data['table_content'];
            $table_schema->company_id = $company_id;
            $table_schema->user_id = $user_id;
            $table_schema->schema_name = $data['schema_name'];
           
            $table_schema->save();
            $table_schema_id = $table_schema->id; 

            DB::commit();

            
            $route = route('all_my_schemas');
            flash('Successfully created!', 'success');
          return response()->json(array('code'=>200, 'status' => 'Ajax ok, id=' + $table_schema_id, 'data' => $data, 'route' => $route));
        }

        return response()->json(array('code'=>400, 'status' => 'Ajax Error',));
    }
    
    public function updateTableSchema(Request $request){
        
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

            $tableSchema = Table_schema::findOrFail($data['schema_id']);
//            Log::info($data['table_content']);
            
//            $tableSchema = DB::table('table_schema')->where('id', $data['schema_id'])->first();
            $tableSchema->table_coord = $data['table_content'];
//            $tableSchema->schema_name = $data['schema_name'];
            
            if($data['new_schema_name'] !== ''){
                $tableSchema->schema_name = $data['new_schema_name'];
            }
           
            $tableSchema->save();

            DB::commit();

            $route = route('all_my_schemas');
            flash('Successfully updated!', 'success');
//            return route('all_my_schemas');
          return response()->json(array('code'=>200, 'status' => 'update Ajax ok', 'route' => $route));
        }

        return response()->json(array('code'=>400, 'status' => 'update Ajax Error',));
    }
    
    public function showAllSchemas(){
        
        if(!Auth::user()->hasRole('Company')){ return redirect()->route('main'); }
        $company_id = Session::get('cmp_mng_id');
        if(!$company_id){ 
            flash('You have no company! Create company first to access this feature. <br> Go to <b>Catering companies -> My comapanies -> Create new company</b>', 'info');
            return redirect()->route('main');
        }
        
        $schemas = DB::table('table_schema')->where('company_id', $company_id)->get();
        
        return view('show.show_schemas', ['schemas' => $schemas]); 
    }
    
    public function getEditSchema($id){
        
        $schema = DB::table('table_schema')->where('id', $id)->first();
        if(count($schema) < 1){
            flash('No such schema!', 'danger');
            return redirect()->back();
        }
        return view('edit.edit_schema', ['schema' => $schema]); 
        
    }
    
    public function deleteSchema($id){
        
        try {
            DB::table('table_schema')->where('id', $id)->delete();
        } catch (QueryException $ex){
            flash('Error! You have table bookings associated with this schema. Delete them first.', 'danger');
            return redirect()->back();
        }
        
        
        
            flash('Deleted', 'danger');
            return redirect()->route('all_my_schemas');
    }
    
    public function showSchema($id) {
        
        $schema = DB::table('table_schema')->where('id', $id)->first();
        
        if(count($schema) < 1){
            flash('No such schema!', 'danger');
            return redirect()->back();
        }
        
        $table_bookings = DB::table('table_bookings')->where([['schema_id', '=' , $id], ['status', '=', 0]])->get();

        return view('show.show_schema', ['schema' => $schema, 'table_bookings' => $table_bookings]); 
    }
    
    public function showSchemaOrder($id) {
        $schema = DB::table('table_schema')->where('id', $id)->first();
        $table_bookings = DB::table('table_bookings')->where([['schema_id', '=' , $id], ['status', '=', 0]])->get();
        $user = DB::table('users')->where('id', Auth::id())->first();
        return view('show.show_schema_order', ['schema' => $schema, 'table_bookings' => $table_bookings, 'user' => $user]); 
    }
    
    public function showAllSchemasListOrder($id) {
        $schemas = DB::table('table_schema')->where('company_id', $id)->get();
        return view('show.show_all_schemas_list_order', ['schemas' => $schemas]); 
    }
    
    public function bookTable(Request $request) {
        
        if($request->ajax()) {
            $data = $request->all();

            $cmp_id = $data['company_id'];
            $cmp_owner_user_id = DB::table('companies')->where('id', $cmp_id )->pluck('user_id');
//            var_dump($cmp_owner_user_id);
            
            DB::beginTransaction();
            
            $table_book = new Table_booking();
            
            $table_book->company_id = $data['company_id'];
            $table_book->user_id = $cmp_owner_user_id[0];
            $table_book->orderer_id =  Auth::id();
            $table_book->schema_id = $data['schema_id'];
            $table_book->table_no = $data['table_no'];
            $table_book->time = $data['time'];
            $table_book->notes = $data['notes'];
            $table_book->first_name = $data['first_name'];
            $table_book->last_name = $data['last_name'];
            $table_book->tel_no = $data['tel_no'];
            $table_book->email = $data['email'];
            
            $table_book->save();

            DB::commit();


          return response()->json(array('code'=>200, 'status' => ' Ajax ok, user id: ', 'user_id' => $cmp_owner_user_id));
        }

        return response()->json(array('code'=>400, 'status' => ' Ajax Error',));
        
    }
    
    public function getTableBookingsCmp(){
        
        if(!Auth::user()->hasRole('Company')){ return
            flash('You have no company! Create company first to access this feature. <br> Go to <b>Catering companies -> My comapanies -> Create new company</b>' , 'info');
            redirect()->route('main'); 
        }
        
        $user_id = Auth::id();
        $bookings = DB::select('
            SELECT tb.id, tb.table_no, ts.schema_name, ts.id t_id, c.co_name, tb.first_name, tb.last_name, tb.time, tb.tel_no, tb.email, tb.status, tb.notes, tb.created_at
                FROM table_bookings tb
                LEFT JOIN companies c ON c.id = tb.company_id
                LEFT JOIN table_schema ts ON ts.id = tb.schema_id
                WHERE tb.user_id = ?
            ', [$user_id]);   
        
        return view('show.show_table_bookings_cmp', ['bookings' => $bookings]); 
    }
    
    public function changeBookingStatus(Request $request) {
        
        if($request->ajax()) {
            $data = $request->all();
            
            $table_booking_old = DB::table('table_bookings')->where('id', $data['booking_id'] )->first();

        if($table_booking_old->status == 0) { $current_stauts = 1; }
            else { $current_stauts = 0; }

            $table_booking = Table_booking::find($data['booking_id']);
            $table_booking->status = $current_stauts;
            $table_booking->save();
            
            if($current_stauts == 0) {$booking_satus = 'Active'; }
            elseif($current_stauts == 1){ $booking_satus = 'Completed'; };
        
            return response()->json(array('code'=>200, 'status' => ' Ajax ok', 'booking_status' => $booking_satus));
        }
        return response()->json(array('code'=>400, 'status' => ' Ajax Request Error',));
    }
    
    public function deleteBooking(Request $request) {
        
        if($request->ajax()) {
            $data = $request->all();
            
            $table_booking = Table_booking::find($data['booking_id']);
            $table_booking->delete();
        
            return response()->json(array('code'=>200, 'status' => ' Ajax ok, deleted'));
        }
        return response()->json(array('code'=>400, 'status' => ' Ajax Request Error',));
        
        
    }
    
    public function getBookingsUser() {
        
        $user_id = Auth::id();
        $bookings = DB::select('SELECT tb.id tb_id, tb.table_no, tb.status, ts.schema_name, ts.id ts_id, c.co_name, tb.first_name, tb.last_name, tb.time, tb.tel_no, tb.email, tb.status, tb.notes, tb.created_at
                        FROM table_bookings tb
                        LEFT JOIN companies c ON c.id = tb.company_id
                        LEFT JOIN table_schema ts ON ts.id = tb.schema_id
                        WHERE tb.orderer_id = ?', [$user_id]);
        
        
        return view('show.show_bookings_user', ['bookings' => $bookings]);
        
    }
    
    public function showAllBookingsAdmin() {
        
        $bookings = DB::select('SELECT tb.table_no, tb.status, ts.schema_name, tb.id, ts.id AS ts_id, c.co_name, tb.first_name, tb.last_name, tb.time, tb.tel_no, tb.email, tb.status, tb.notes, tb.created_at
                        FROM table_bookings tb
                        LEFT JOIN companies c ON c.id = tb.company_id
                        LEFT JOIN table_schema ts ON ts.id = tb.schema_id'
                        );
        
        
        return view('show.show_bookings_admin', ['bookings' => $bookings]);
        
    }
    
    
    
    
    
    
    
    
}