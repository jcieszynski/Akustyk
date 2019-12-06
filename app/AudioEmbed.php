<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Embed\Embed;

class AudioEmbed extends Model
{
    protected $table = 'audio_embed';
    protected $hidden = ['category_id', 'created_at', 'updated_at'];

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
            $link = Embed::create($this->url);
            $this->name = $link->title;
            $this->description = $link->description;
            $this->embed = $link->code;
            $this->url = $link->url;
            $this->addCategoryAndAuthor();
        } else {
            $this->addCategoryAndAuthor();
        }
        parent::save();
    }

}
