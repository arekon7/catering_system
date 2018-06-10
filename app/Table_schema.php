<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Table_schema extends Model
{
    
    protected $table = 'table_schema';
    
    public function table_schema()
    {
        return $this->belongsTo('App\Company');
    }
}
