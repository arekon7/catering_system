<?php

namespace App\Http\Controllers;
use App\User;
use App\Role;
use Illuminate\Http\Request;

class AppController extends Controller
{
    public function getIndex()
    {
        return view('index');
    }
    
    public function getAuthorPage()
    {
        return view('author');
    }

    public function getAdminPage()
    {
        $users = User::all();
        return view('admin', ['users' => $users]);
    }

    public function getGenerateArticle()
    {
        return response('Article generated!', 200);
    }
    
    public function postAdminAssignRoles(Request $request)
    {
        $user = User::where('email', $request['email'])->first();
        $user->roles()->detach();
//        var_dump($request['role']);
        if ($request['role'] == 'role_user') {
            $user->roles()->attach(Role::where('name', 'User')->first());
        }
        elseif ($request['role'] == 'role_company') {
            $user->roles()->attach(Role::where('name', 'Company')->first());
        }
        elseif ($request['role'] == 'role_admin') {
            $user->roles()->attach(Role::where('name', 'Admin')->first());
        }
        flash('Successfully changed!');
        return redirect()->back();
    }
}