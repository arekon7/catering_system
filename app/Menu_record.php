<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu_record extends Model
{
    
    protected $table = 'menu';
    
    protected $fillable = ['company_id', 'category_id', 'item', 'description', 'price'];
//    public function menu_record()
//    {
//        return $this->belongsTo('App\Company');
//    }
}
