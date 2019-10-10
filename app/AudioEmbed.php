<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Embed\Embed;

class AudioEmbed extends Model
{
    public $table = 'audio_embed';
    public $fillable = ['embed', 'visible'];
    public $hidden = ['id', 'category_id'];

    public function save(array $options = [])
    {
        try {
            $link = Embed::create($this->url);
            $this->name = $link->title;
            $this->description = $link->description;
            $this->embed = $link->code;
            $this->url = $link->url;
            if (request()->get('audio_embed_belongsto_music_category_relationship') == NULL) {
                $this->category_id = 0;
            } else {
                $this->category_id = request()->audio_embed_belongsto_music_category_relationship;
            }
            if (!$this->author && app('VoyagerAuth')->user()) {
                $this->author = app('VoyagerAuth')->user()->name;
            }

        } catch (\Exception $exception) {
            return;
        }

        parent::save();
    }

}
