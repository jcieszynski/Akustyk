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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes(['verify' => true]);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/auth/redirect/{provider}', 'SocialController@redirect');
Route::get('/callback/{provider}', 'SocialController@callback');

Route::get('/home', 'HomeController@index')->name('home');
Route::get('contact-us', 'ContactFormController@ContactForm');
Route::post('contact-us', ['as' => 'contactForm.store', 'uses' => 'ContactFormController@contactFormPost']);
Route::get('/music', 'AudioController@index')->name('music');
Route::get('/gallery', 'EquipmentGalleryController@index')->name('gallery');

Route::get('music/{category}', function ($musicCategory) {
    $musicEmbedCategories = DB::table('music_category')->where('name', $musicCategory)->where('visible', true)->first();
    if (!$musicEmbedCategories) {
        return abort('404');
    }
    $id = $musicEmbedCategories->id;
    $category = \App\MusicCategory::all();
    $audio = DB::table('audio_embed')->where('category_id', $id)->where('visible', true)->get();
    return view('audio', compact('audio', 'category'));
});

Route::get('{slug}', [
    'uses' => 'PagesController@getPage'
])->where('slug', '([A-Za-z0-9\-\/]+)');
