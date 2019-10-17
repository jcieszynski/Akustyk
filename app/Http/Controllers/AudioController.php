<?php

namespace App\Http\Controllers;

use App\AudioEmbed;
use App\MusicCategory;

class AudioController extends Controller
{

    public function index()
    {
        $audio = AudioEmbed::paginate(10);
        $category = MusicCategory::all();
        return view('audio')->with(compact('audio', 'category'));
    }
}
