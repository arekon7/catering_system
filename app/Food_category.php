<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Food_category extends Model
{
    
    protected $table = 'food_categories';
    
    public function food_category()
    {
        return $this->belongsTo('App\Menu');
    }
}
