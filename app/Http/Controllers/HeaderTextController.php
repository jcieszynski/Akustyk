<?php

namespace App\Http\Controllers;

use App\DefaultText;
use Voyager;
use Lang;

class HeaderTextController extends Controller
{
    public static function headerText()
    {
        $header = DefaultText::withTranslations()->get();
        if (Voyager::translatable($header)) {
            $header = $header->translate($header, Lang::getLocale());
        }
        return $header;

    }
}
