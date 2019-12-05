<?php

namespace App\Http\Controllers;

use TCG\Voyager\Models\Page;

class PagesController extends Controller
{

    public function getPage($slug = null)
    {
        $page = Page::where('slug', $slug)->where('status', 'active');
        $page = $page->firstOrFail();

        return view('page')->with('page', $page);
    }
}
