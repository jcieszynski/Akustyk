<?php

namespace App\Http\Controllers;

use App\EquipmentGallery;
use Lang;
use Voyager;

class EquipmentGalleryController extends Controller
{

    public function index()
    {
        $gallery = EquipmentGallery::withTranslations()->get();
        if (Voyager::translatable($gallery)) {
            $gallery = $gallery->translate($gallery, Lang::getLocale());
        }
        return view('equipmentgallery')->with(['gallery' => $gallery]);
    }
}
