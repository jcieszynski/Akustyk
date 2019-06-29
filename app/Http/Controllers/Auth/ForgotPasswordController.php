<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;

    public function sendResetLinkEmail(Request $request)
    {
        $this->validate($request, ['email' => 'required|email']);
        $checkUser = User::where('email', $request->email)->first();
        try {
            if ($checkUser->provider != 'laravel') {
                return back()->with('status', trans('messages.social_email'));

            }
        } catch (\Exception $e) {
            return back()->withErrors(['email' => trans('validation.email_not_exist')]);

        }
        if (is_null($checkUser->email_verified_at)) {
            return back()->with('status', trans('messages.acc_not_activ'));
        } else {
            $response = $this->broker()->sendResetLink($request->only('email'));
        }
        if ($response === \Password::sendResetLink()) {
            return back()->with('status', trans($response));

        }
        return back()->withErrors(['email' => trans($response)]);

    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }
}
