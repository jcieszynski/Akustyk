<?php

namespace App\Http\Controllers;

use Socialite;
use App\User;
use Flash;
use Carbon\Carbon;

class SocialController extends Controller
{
    protected function socialLastLogin(User $user)
    {
        $user->update([
            'last_login' => Carbon::now()->toDateTimeString(),
        ]);
    }

    public function redirect($provider)
    {
        return Socialite::driver($provider)->redirect();
    }

    public function callback($provider)
    {
        try {
            $socialUser = Socialite::driver($provider)->user();

        } catch (\Exception $e) {
            return \Redirect::to('auth/' . $provider);

        }
        $user = $this->createOrFindUser($socialUser, $provider);
        if (!$user) {
            flash(trans('messages.acc_email_exist'))->warning();
            return redirect()->to('/login');

        }
        auth()->login($user, true);
        $this->socialLastLogin($user);
        flash(trans('messages.login_success'))->success();
        return redirect()->to('/');
    }

    private function createOrFindUser($socialUser, $provider)
    {
        if ($user = User::where('email', $socialUser->email)->first()) {
            if ($user->provider_id == $socialUser->id) {
                return $user;

            } else {
                return false;
            }
        }

        return $user = User::create([
            'name' => $socialUser->name,
            'email' => $socialUser->email,
            'email_verified_at' => Carbon::now()->toDateTimeString(),
            'avatar' => $socialUser->avatar,
            'provider' => $provider,
            'provider_id' => $socialUser->id,
        ]);
    }
}
