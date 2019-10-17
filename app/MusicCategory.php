<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MusicCategory extends Model
{
    public $table = 'music_category';
    public $fillable = ['name', 'visible'];
    public $hidden = ['id'];


    public function save(array $options = [])
    {
        if (!$this->author_id && app('VoyagerAuth')->user()) {
            $this->author_id = app('VoyagerAuth')->user()->getKey();
        }

        parent::save();
    }
}
