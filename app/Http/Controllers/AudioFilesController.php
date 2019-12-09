<?php

namespace App\Http\Controllers;

use App\MusicCategory;
use App\MusicCollection;
use Illuminate\Support\Facades\Storage;

class AudioFilesController extends Controller
{
    public function index()
    {
        $music = MusicCollection::orderBy('created_at','desc')->paginate(10);
        $category = MusicCategory::all();
        return view('audio-files')->with(compact('music', 'category'));

    }

    public function __construct()
    {
        $this->middleware(['auth', 'verified']);
    }

    public static function getDownload($file)
    {
        return Storage::disk(config('voyager.storage.disk'))->url($file);
    }
}
