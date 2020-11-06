<?php


namespace App\Http\Controllers;


use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class VoyagerUserController extends \TCG\Voyager\Http\Controllers\VoyagerUserController
{

    public function store(Request $request)
    {
        $request->merge([
            'provider' => 'laravel',
            'email_verified_at' => Carbon::now()->toDateTimeString(),
        ]);
        return parent::store($request);
    }

    public function update(Request $request, $id)
    {
        $user = User::where('id', $id)->first();
        $request->merge([
            'provider' => $user->provider,
            'email_verified_at' => $user->email_verified_at
        ]);

        if ($user->provider != 'laravel' && !empty($request->password)) {
            return redirect()->back()->withErrors(__('validation.admin-panel-social-pw'));
        }

        return parent::update($request, $id);
    }
}
