<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;

class MusicCategory extends Model
{
    protected $table = 'music_category';
    protected $fillable = ['name', 'visible'];
    protected $hidden = ['id'];


    public function save(array $options = [])
    {
        if (!$this->author_id && Auth::user()) {
            $this->author_id = Auth::user()->getKey();
        }

        parent::save();
    }

    public static function replaceDiactiticChars($str)
    {
        $newChar = str_replace("Ą", "A", $str);
        $newChar = str_replace("Ć", "C", $newChar);
        $newChar = str_replace("Ę", "E", $newChar);
        $newChar = str_replace("Ł", "L", $newChar);
        $newChar = str_replace("Ń", "N", $newChar);
        $newChar = str_replace("Ó", "O", $newChar);
        $newChar = str_replace("Ś", "S", $newChar);
        $newChar = str_replace("Ź", "Z", $newChar);
        $newChar = str_replace("Ż", "Z", $newChar);

        $newChar = str_replace("ą", "a", $newChar);
        $newChar = str_replace("ć", "c", $newChar);
        $newChar = str_replace("ę", "e", $newChar);
        $newChar = str_replace("ł", "l", $newChar);
        $newChar = str_replace("ń", "n", $newChar);
        $newChar = str_replace("ó", "o", $newChar);
        $newChar = str_replace("ś", "s", $newChar);
        $newChar = str_replace("ź", "z", $newChar);
        $newChar = str_replace("ż", "z", $newChar);
        return ($newChar);
    }
}
