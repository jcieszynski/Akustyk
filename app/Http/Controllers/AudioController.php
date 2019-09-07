<?php

namespace App\Http\Controllers;

use App\AudioEmbed;

class AudioController extends Controller
{
    public function index()
    {
        $audio = AudioEmbed::all();
        return view('audio')->with(['audio' => $audio]);
    }
}
