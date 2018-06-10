<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CompanyImage extends Model
{
    //
    protected $table = 'company_images';

    protected $fillable = [
                           'image_name',
                           'image_path',
                           'image_extension'
    ];
}
