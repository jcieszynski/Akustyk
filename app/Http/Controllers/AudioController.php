<?php

namespace App\Http\Controllers;

use App\AudioEmbed;
use App\MusicCategory;

class AudioController extends Controller
{

    public function index()
    {
        $audio = AudioEmbed::orderBy('created_at','desc')->paginate(10);
        $category = MusicCategory::all();
        return view('audio')->with(compact('audio', 'category'));
    }
}
