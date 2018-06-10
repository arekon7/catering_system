<?php

namespace App\Http\Controllers;
use App\User;
use App\Role;
use Illuminate\Http\Request;

class SbAdmCtrl extends Controller
{
    public function showSbAdm()
    {
        return view('sb_adm');
    }
    
    public function showMaterialForm()
    {
        return view('material_form');
    }
    
}