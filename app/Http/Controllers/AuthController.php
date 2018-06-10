<?php

namespace App\Http\Controllers;

use App\User;
use App\Role;
use App\Company;
use App\CompanyImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Redirect;
use Symfony\Component\HttpFoundation\Session\Session;

class AuthController extends Controller
{
    public function getSignUpPage()
    {
        return view('auth.signup');
    }

    public function getSignInPage()
    {
        return view('auth.signin');
    }

    public function postSignUp(Request $request)
    {
        
        $this->validate($request, [
             'email' => 'required|unique:users|email',
             'first_name' => 'required|regex:/^[a-zA-ZĄČĘĖĮŠŲŪąčęėįšųū]+$/u|max:50',
             'last_name' => 'required|regex:/^[a-zA-ZĄČĘĖĮŠŲŪąčęėįšųū]+$/u|max:50',
             'tel_no' => 'required|max:33|regex:/^(\+)[0-9]{11}$/',
         ]);
        
           DB::beginTransaction();
           
            $user = new User();
            $user->first_name = $request['first_name'];
            $user->last_name = $request['last_name'];
            $user->email = $request['email'];
            $user->tel_no = $request['tel_no'];
            $user->password = Hash::make($request['password']);
            $user->acc_type = $request['acc_type'];
            $user->save();
            $user->roles()->attach(Role::where('name', 'User')->first());

            $user_id = $user->id;
            if($user->acc_type == 1){
                $user->roles()->detach();
                $user->roles()->attach(Role::where('name', 'Company')->first());
            }
            
            DB::commit();
            
            flash()->success('Registration Seccessful! Now you can Log In!');
            return redirect()->route('signin');
            
            
    }

    public function postSignIn(Request $request)
    {
        if (Auth::attempt(['email' => $request['email'], 'password' => $request['password']])) {
            $request->session()->put('user_email', $request['email']);
            $user_roles = Auth::user()->hasRoles();
            $user_roles_arr = [];
            foreach($user_roles as $user_roles){
                $user_roles_arr[] = $user_roles->name;
            }
            $request->session()->put('user_roles', $user_roles_arr);
            $cmp_mng_id = DB::table('companies')->where('user_id', Auth::id())->first();
//            var_dump($cmp_mng_id->id);
            
            if((Auth::user()->hasRole('Company')) && ($cmp_mng_id != null)){
                $request->session()->put('cmp_mng_id', $cmp_mng_id->id);
                $request->session()->put('cmp_mng_name', $cmp_mng_id->co_name);
            }
//            return $cmp_mng_id->id;
            flash('Successfully logged in ' . $request->session()->get('user_email') , 'info');
            return Redirect::intended();
        }
        flash('Check your email or password and ty again!', 'danger');
        return redirect()->back();
    }

    public function getLogout()
    {
        Auth::logout();
        session()->flush();
        flash('Successfully logged out!' , 'info');
        return redirect()->route('main');
    }
}