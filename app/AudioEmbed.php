<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Embed\Embed;

class AudioEmbed extends Model
{
    public $table = 'audio_embed';
    public $fillable = ['embed,visible'];

    public function save(array $options = [])
    {
        $link = Embed::create($this->embed);
        $this->embed = $link->code;
        $this->url = $link->url;
        if (!$this->author && app('VoyagerAuth')->user()) {
            $this->author = app('VoyagerAuth')->user()->name;
        }
        parent::save();
    }

}
