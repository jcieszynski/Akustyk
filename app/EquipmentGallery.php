<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use \TCG\Voyager\Traits\Translatable;
use Voyager;

class EquipmentGallery extends Model
{
    use Translatable;

    public $table = 'equipment_gallery';
    public $fillable = ['image,description,name'];
    protected $translatable = ['description', 'name'];

    protected $hidden = [
        'updated_at', 'user_id', 'created_at', 'author,id'
    ];

    public function save(array $options = [])
    {
        if (!$this->author_id && app('VoyagerAuth')->user()) {
            $this->author_id = app('VoyagerAuth')->user()->getKey();
        }

        parent::save();
    }

    public function authorId()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'author_id', 'id');
    }

}
