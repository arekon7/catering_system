<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/



Route::group(['middlewareGroups' => 'web'], function () {
    
    
    Route::get('/admin', [
        'uses' => 'AppController@getAdminPage',
        'as' => 'admin',
        'middleware' => 'roles',
        'roles' => ['Admin']
    ]);

    Route::post('/admin/assign-roles', [
        'uses' => 'AppController@postAdminAssignRoles',
        'as' => 'admin.assign',
        'middleware' => 'roles',
        'roles' => ['Admin']
    ]);

    Route::get('/signup', [
        'uses' => 'AuthController@getSignUpPage',
        'as' => 'signup'
    ]);

    Route::post('/signup', [
        'uses' => 'AuthController@postSignUp',
        'as' => 'signup'
    ]);

    Route::get('/signin', [
        'uses' => 'AuthController@getSignInPage',
        'as' => 'signin'
    ]);

    Route::post('/signin', [
        'uses' => 'AuthController@postSignIn',
        'as' => 'signin'
    ]);

    Route::get('/logout', [
        'uses' => 'AuthController@getLogout',
        'as' => 'logout'
    ]);
    
    Route::get('/sb_adm', [
        'uses' => 'SbAdmCtrl@showSbAdm',
        'as' => 'showSbAdm'
    ]);
    
    Route::get('/', [
        'uses' => 'MainController@showCompanies',
        'as' => 'main'
    ]);
    

    
    Route::get('/edit_company/{id?}',[
       'uses' => 'MainController@getEditCompany',
        'as' => 'edit_company',
        'middleware' => 'roles',
        'roles' => ['Admin']
    ]);
    
    Route::get('/delete_company/{id}', [
        'uses' => 'MainController@deleteCompany',
        'as' => 'delete_company',
        'middleware' => 'roles',
        'roles' => ['Company','Admin']
    ]);
    
    Route::patch('/updateCompany/{id}',[
       'uses' => 'MainController@updateCompany',
        'as' => 'updateCompany',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company']
    ]);
    
    Route::get('/show_company/{id}',[
        'uses' => 'MainController@showCompany',
        'as' => 'show_company'
    ]);
    Route::get('/edit_category/{id?}',[
       'uses' => 'FoodMenuCtrl@getEditCategory',
        'as' => 'edit_category',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company']
    ]);
    
    Route::post('/updateCategory/{id}',[
       'uses' => 'FoodMenuCtrl@update_category',
        'as' => 'update_category',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company']
    ]);
    
    Route::get('/choose_cmp_mng/{id}', [
        'uses' => 'MainController@chooseCmpMng',
        'as' => 'choose_cmp_mng',
        'middleware' => 'roles',
        'roles' => ['Company','Admin']
    ]);
    
    
    // menuu ---
    Route::get('/food_menu/{id?}',[
        'uses' => 'FoodMenuCtrl@showFoodMenu',
        'as' => 'food_menu'
    ]);
    
    Route::get('/profile/',[
        'uses' => 'MainController@showProfile',
        'as' => 'profile',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company', 'User']
    ]);
    
    Route::patch('/profile/{id?}',[
        'uses' => 'MainController@updateProfile',
        'as' => 'profile',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company', 'User']
    ]);
    
    Route::get('/orders/',[
        'uses' => 'FoodMenuCtrl@showOrders',
        'as' => 'orders',
        'middleware' => 'roles',
        'roles' => ['Company']
    ]);    
    
    Route::get('/orders_user/',[
        'uses' => 'FoodMenuCtrl@showOrdersUser',
        'as' => 'orders_user',
        'middleware' => 'roles',
        'roles' => ['User', 'Company', 'Admin']
    ]);
    Route::get('/orders_all/',[
        'uses' => 'FoodMenuCtrl@showAllOrdersAdmin',
        'as' => 'orders_all',
        'middleware' => 'roles',
        'roles' => ['Admin']
    ]);
    Route::get('/bookings_all/',[
        'uses' => 'TablesCtrl@showAllBookingsAdmin',
        'as' => 'bookings_all',
        'middleware' => 'roles',
        'roles' => ['Admin']
    ]);
    Route::get('/show_create_food_category/',[
        'uses' => 'FoodMenuCtrl@showCreateFoodCat',
        'as' => 'show_create_food_category',
        'middleware' => 'roles',
        'roles' => ['Company', 'Admin']
    ]);
    
    
    // ---- TABLES MAP ----------
    Route::get('/tables_map/{id?}',[
        'uses' => 'TablesCtrl@createTableMap',
        'as' => 'tables_map',
//        'middleware' => 'roles',
//        'roles' => ['Admin']
    ]);
    
    Route::get('/all_my_schemas/',[
        'uses' => 'TablesCtrl@showAllSchemas',
        'as' => 'all_my_schemas'
    ]);
    
     Route::get('/edit_schema/{id}',[
       'uses' => 'TablesCtrl@getEditSchema',
        'as' => 'edit_schema',
        'middleware' => 'roles',
        'roles' => ['Company', 'Admin']
    ]);
     
//     delete_schema
     Route::delete('/delete_schema/{id}',[
        'uses' => 'TablesCtrl@deleteSchema',
        'as' => 'delete_schema',
        'middleware' => 'roles',
        'roles' => ['Company', 'Admin']
    ]);
     
     Route::get('/show_schema/{id}',[
       'uses' => 'TablesCtrl@showSchema',
        'as' => 'show_schema',
        'middleware' => 'roles',
    ]);
     
     Route::get('/show_schema_order/{id}',[
       'uses' => 'TablesCtrl@showSchemaOrder',
        'as' => 'show_schema_order',
//        'middleware' => 'roles',
    ]);
     
     Route::get('/delete_photo/{id}',[
        'uses' => 'MainController@deletePhoto',
        'as' => 'delete_photo',
        'middleware' => 'roles',
        'roles' => ['Company', 'Admin']
    ]);
     
     
     Route::get('/show_all_schemas_list_order/{id}',[
       'uses' => 'TablesCtrl@showAllSchemasListOrder',
        'as' => 'show_all_schemas_list_order',
//        'middleware' => 'roles',
    ]);
     
    Route::post('/book_table/', [
        'uses' => 'TablesCtrl@bookTable', 
        'as' => 'book_table',
        'middleware' => 'roles', 
        'roles' => ['User','Company', 'Admin']
        
        ]);

    Route::get('/table_bookings_cmp/', [
        'uses' => 'TablesCtrl@getTableBookingsCmp', 
        'as' => 'table_bookings_cmp',
        'middleware' => 'roles', 
        'roles' => ['Company', 'Admin']
        
        ]);
    
    Route::POST('/change_booking_status/', [
        'uses' => 'TablesCtrl@changeBookingStatus', 
        'as' => 'change_booking_status',
        'middleware' => 'roles', 
        'roles' => ['Company', 'Admin']
        
        ]);
    
    
     Route::POST('/delete_booking/', [
        'uses' => 'TablesCtrl@deleteBooking', 
        'as' => 'delete_booking',
        'middleware' => 'roles', 
        'roles' => ['Company', 'Admin', 'User']
        
        ]);
     
     Route::POST('/delete_order/', [
        'uses' => 'FoodMenuCtrl@deleteOrder', 
        'as' => 'delete_order',
        'middleware' => 'roles', 
        'roles' => ['Company', 'Admin', 'User']
        
        ]);
     
     Route::POST('/change_order_status/', [
        'uses' => 'MainController@changeOrderStatus', 
        'as' => 'change_order_status',
        'middleware' => 'roles', 
        'roles' => ['Company', 'Admin']
        
        ]);
     
     Route::POST('/delete_order/', [
        'uses' => 'MainController@deleteOrder', 
        'as' => 'delete_order',
        'middleware' => 'roles', 
        'roles' => ['Company', 'Admin', 'User']
        
        ]);
    
     
     
    
   // -------END TABLES MAP ---------------- 
     
   // -- MENU -----------------
   Route::get('/menu_management/',[
        'uses' => 'FoodMenuCtrl@showMenuManagement',
        'as' => 'menu_management',
        'middleware' => 'roles',
        'roles' => ['Company', 'Admin']
    ]);
   
    Route::get('/edit_menu_item/{id}',[
       'uses' => 'FoodMenuCtrl@editMenuItem',
        'as' => 'edit_menu_item',
        'middleware' => 'roles',
        'roles' => ['Company', 'Admin']
    ]);
     
    Route::get('create_menu_item', ['uses' => 'FoodMenuCtrl@createMenuEntry_show', 'as' => 'create_menu_item', 'middleware' => 'roles', 'roles' => ['Company', 'Admin']]);
    Route::post('store_menu_item', ['uses' => 'FoodMenuCtrl@createMenuEntry', 'as' => 'store_menu_item', 'middleware' => 'roles', 'roles' => ['Company', 'Admin']]);
    
    Route::get('food_category_management', ['uses' => 'FoodMenuCtrl@foodCatMngmnt', 'as' => 'food_category_management', 'middleware' => 'roles', 'roles' => ['Company', 'Admin']]);
    Route::post('create_food_category', ['uses' => 'FoodMenuCtrl@createFoodCategory', 'as' => 'create_food_category',  'middleware' => 'roles', 'roles' => ['Company', 'Admin']]);
    
    Route::post('updateMenuItem', ['uses' => 'FoodMenuCtrl@update_menu_item', 'middleware' => 'roles', 'as' => 'updateMenuItem', 'roles' => ['Company', 'Admin']]);
    
    Route::delete('/delete_menu_item/{id}',[
        'uses' => 'FoodMenuCtrl@deleteMenuItem',
        'as' => 'delete_menu_item',
        'middleware' => 'roles',
        'roles' => ['Company', 'Admin']
    ]);
    
    Route::delete('/delete_food_cat/{id}',[
        'uses' => 'FoodMenuCtrl@deleteFoodCategory',
        'as' => 'delete_food_cat',
        'middleware' => 'roles',
        'roles' => ['Company', 'Admin']
    ]);
    
    
    // --------- END MENU ---------------
    
    Route::get('/show_all_my_companies/',[
        'uses' => 'MainController@showAllMyCompanies',
        'as' => 'show_all_my_companies',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company']
    ]);
    
    Route::get('/edit_my_company/{id}',[
       'uses' => 'MainController@getEditMyCompany',
        'as' => 'edit_my_company',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company']
    ]);
    
    Route::get('/create_company/',[
       'uses' => 'MainController@getCreateCompany',
        'as' => 'create_company',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company']
    ]);
    
     Route::post('/create_company/',[
       'uses' => 'MainController@postCreateCompany',
        'as' => 'create_company',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company']
    ]);
     
     
     
     Route::get('/miestai/{miestas}/',[
       'uses' => 'MainController@showSpecTownCmp',
        'as' => 'show_town_cmp',
    ]);
    
    
     Route::get('/bookings_user/',[
       'uses' => 'TablesCtrl@getBookingsUser',
        'as' => 'bookings_user',
        'middleware' => 'roles',
        'roles' => ['Admin', 'Company', 'User']
    ]);
    
    
//    ---------------- ????? --------
    
//    --------------------------
    
});
    //  AJAX
    //orders
    Route::post('/createorder/', ['uses' => 'FoodMenuCtrl@createOrder', 'as' => 'createorder']);
    
    // table schemas
    Route::post('/createschema/', ['uses' => 'TablesCtrl@createTableSchema', 'as' => 'createschema']);
    Route::post('/updateschema/', ['uses' => 'TablesCtrl@updateTableSchema', 'as' => 'updateschema']);
    
    // Menu
    
    
    
//   for TESTING purposes ------------------------------------------
    
    
    Route::post('home', 'HomeController@upload');


    Route::get('/table', function(){
    
        return view('table');
    });
    
    Route::get('/material_form', function(){
    
        return view('material_form');
    });

    Route::resource('mainctrl', 'MainController');
    Route::resource('marketingimage', 'MarketingImageController');
    
    Route::get('/test', function(){
        
//        $companies = DB::select('SELECT * from companies c, company_images ci where c.main_pht = ci.image_no AND  c.id = ci.company_id');
//        dd($companies);
    });




