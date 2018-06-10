<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class User extends Authenticatable
{
    public function roles()
    {
        return $this->belongsToMany('App\Role', 'user_role', 'user_id', 'role_id');
    }
    
    public function companies(){
         return $this->hasMany('App\Models\Company');
    }
    
    public function hasAnyRole($roles)
    {
        if (is_array($roles)) {
            foreach ($roles as $role) {
                if ($this->hasRole($role)) {
                    return true;
                }
            }
        } else {
            if ($this->hasRole($roles)) {
                return true;
            }
        }
        return false;
    }
    
    public function hasRole($role)
    {
        if ($this->roles()->where('name', $role)->first()) {
            return true;
        }
        return false;
    }
    
    public function hasCompany(){
        
        if($company_id = DB::table('companies')->where('user_id', Auth::id())->value('id')){
//            dd($company_id);
            return $company_id;
        }
        return false; 
    }
    
    public function hasRoles() {
        
        $user_id = Auth::id();
        if(!$user_id) {
            flash('Error loading user', 'danger');
            return redirect()->route('main');
        }
        $roles = DB::select('SELECT 
                                u.id,
                                r.name	
                            FROM users AS u
                            LEFT JOIN user_role AS ur ON ur.user_id = u.id
                            LEFT JOIN roles AS r ON r.id = ur.role_id
                            WHERE u.id = ?', 
                            [$user_id]);
        return $roles;
        
    }
   
    
}
