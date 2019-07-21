<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\ContactForm;
use Jenssegers\Agent\Agent;
use Mail;
use Auth;

class ContactFormController extends Controller
{

    public function contactForm()
    {
        return view('contact');
    }

    public function contactFormPost(Request $request)
    {
        $agent = new Agent();

        $this->validate($request, [
            'user' => 'required|string|min:3|max:50',
            'email' => 'required|email|blacklist|max:100',
            'message' => 'required|min:10',
            'g-recaptcha-response' => 'required|captcha'
        ]);
        $browser = $agent->browser();
        $browserVersion = $agent->version($browser);
        $platform = $agent->platform();
        $platformVersion = $agent->version($platform);
        $device = $agent->device() ? $agent->device() : trans('parameters.other_device');
        $languages = $agent->languages();

        $userInfo = trans('parameters.browser') . $browser . ',' . trans('parameters.browser_version') . $browserVersion . ',' . trans('parameters.os') . $platform . ',' . trans('parameters.os_ver') .
            $platformVersion . ',' . trans('parameters.device') . $device . ',' . trans('parameters.languages') . implode(',', $languages);
        if (($users = ContactForm::where('ip_address', $request->ip())->latest('created_at')->first()) && !Auth::check()) {
            if (Carbon::now()->diffInHours($users->created_at) <= 1) {
                flash( trans('messages.msg_after_1h'))->warning();
                return redirect()->to('/contact-us');
            }
        }
        $request->request->add(['ip_address' => $request->ip()]);
        $request->request->add(['user_agent' => $userInfo]);
        ContactForm::create($request->all());

        Mail::send('email', array(
            'name' => $request->get('user'),
            'email' => $request->get('email'),
            'text' => $request->get('message')
        ), function ($message) {
            $message->to('akustykpwsz@gmail.com', 'Admin')->subject(trans('parameters.mail_message_from_cforms'));
        });
        return back()->with('success', trans('messages.thank_contact_us'));
    }
}
