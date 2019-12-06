<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;

class MusicCollection extends Model
{
    protected $table = "music_collection";

    public function addCategoryAndAuthor()
    {
        if (request()->get('category_id') == NULL) {
            $this->category_id = 0;
        } else {
            if (isset($this->category_id)) {
                $this->category_id = request()->category_id;
            }
        }
        if (!$this->author && Auth::user()) {
            $this->author = Auth::user()->name;
        }
    }

    public function save(array $options = [])
    {
        if ($this->created_at == $this->updated_at) {
            if ($this->checkMimeInString()) {
                $originalName = json_decode($this->path)[0]->original_name;
                $this->name = strpos($originalName, 'mp3')
                    ? explode('.mp3', $originalName)[0] : explode('.wav', $originalName)[0];
                $this->addCategoryAndAuthor();
            } else {
                return;
            }
        } else {
            $this->addCategoryAndAuthor();
            parent::save();
        }
        parent::save();

    }

    public function checkMimeInString()
    {
        return (strpos($this->path, '.mp3') || strpos($this->path, '.wav')) ? true : false;
    }

}
