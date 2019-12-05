<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;
use \TCG\Voyager\Traits\Translatable;
use Voyager;

class EquipmentGallery extends Model
{
    use Translatable;

    protected $table = 'equipment_gallery';
    protected $translatable = ['name'];

    protected $hidden = [
        'updated_at', 'user_id', 'created_at', 'author,id'
    ];

    public function save(array $options = [])
    {
        if (!$this->author_id && Auth::user()) {
            $this->author_id = Auth::user()->getKey();
        }

        parent::save();
    }

}
