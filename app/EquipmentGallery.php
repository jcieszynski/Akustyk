<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class EquipmentGallery extends Model
{
    public $table = 'equipment_gallery';
    public $fillable = ['image,description,name'];

    protected $hidden = [
        'updated_at', 'user_id', 'created_at'
    ];

}
