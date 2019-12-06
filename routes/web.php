<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('lang/{locale}', 'LocalizationController@index');

Auth::routes(['verify' => true]);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
Route::get('/', function () {
    $posts = App\Post::paginate(5)->sortByDesc("created_at");
    return view('welcome', compact('posts'));
});

Route::get('/auth/redirect/{provider}', 'SocialController@redirect');
Route::get('/callback/{provider}', 'SocialController@callback');
Route::post('comments', config('comments.controller') . '@store')->middleware('verified');
Route::get('profile', 'UserController@profile');
Route::post('profile', 'UserController@update_profile');
Route::get('contact-us', 'ContactFormController@ContactForm');
Route::post('contact-us', ['as' => 'contactForm.store', 'uses' => 'ContactFormController@contactFormPost']);
Route::get('/music', 'AudioController@index')->name('music');
Route::get('/gallery', 'EquipmentGalleryController@index')->name('gallery');
Route::get('/audio-files', 'AudioFilesController@index')->name('audio-files');
Route::get('post/{slug}', function ($slug) {
    $post = App\Post::where('slug', '=', $slug)->firstOrFail();
    return view('post', compact('post'));
});
Route::get('music/{category}', function ($musicCategory) {
    $musicEmbedCategories = DB::table('music_category')->where('name', $musicCategory)->where('visible', true)->first();
    if (!$musicEmbedCategories) {
        return abort('404');
    }
    $id = $musicEmbedCategories->id;
    $category = \App\MusicCategory::all();
    $audio = DB::table('audio_embed')->where('category_id', $id)->where('visible', true)
        ->orderBy('created_at', 'desc')->paginate(10);
    return view('audio', compact('audio', 'category'));
});

Route::get('audio-files/{category}', function ($musicCategory) {
    $musicCategories = DB::table('music_category')->where('name', $musicCategory)
        ->where('visible', true)->first();
    if (!$musicCategories) {
        return abort('404');
    }
    $id = $musicCategories->id;
    $category = \App\MusicCategory::all();
    $music = DB::table('music_collection')->where('category_id', $id)
        ->where('visible', true)
        ->orderBy('created_at', 'desc')->paginate(10);
    return view('audio-files', compact('music', 'category'));
})->name('audio-files')->middleware('verified');

Route::get('{slug}', [
    'uses' => 'PagesController@getPage'
])->where('slug', '([A-Za-z0-9\-\/]+)');
