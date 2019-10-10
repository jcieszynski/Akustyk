<?php

namespace App\Http\Controllers;

use App\EquipmentGallery;

class EquipmentGalleryController extends Controller
{

    public function index()
    {
        $gallery = EquipmentGallery::all();
        return view('equipmentgallery')->with(['gallery' => $gallery]);
    }
}
