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
        try {
            $link = Embed::create($this->url);
            $this->embed = $link->code;
            $this->url = $link->url;
            if (!$this->author && app('VoyagerAuth')->user()) {
                $this->author = app('VoyagerAuth')->user()->name;
            }
        } catch (\Exception $exception) {
            return;
        }

        parent::save();
    }

}
