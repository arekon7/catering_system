<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Table_booking extends Model
{
    
    protected $table = 'table_bookings';
    
    public function table_booking()
    {
        return $this->belongsTo('App\Company');
    }
}
