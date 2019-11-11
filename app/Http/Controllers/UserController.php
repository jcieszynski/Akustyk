<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Http\Request;

class UserController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function profile()
    {
        $user = Auth::user();
        return view('profile', compact('user', $user));
    }

    public function update_profile(Request $request)
    {
        $user = Auth::user();


        if ($request->hasFile('avatar')) {

            $request->validate([
                'avatar' => 'required|image|mimes:jpeg,png,jpg|max:2048',
            ]);
            $avatarName = $user->id . '_avatar' . time() . '.' . request()->avatar->getClientOriginalExtension();

            $path = $request->avatar->storeAs((config('voyager.storage.disk') . '/users'), $avatarName);
            $path = str_replace('public', '', $path);
            $user->avatar = $path;
        }
        if ($request->password) {
            $this->validate($request, [

                'password' => 'min:8|max:50|required|numbers|case_diff',
            ]);
            $user->password = bcrypt($request->password);
        }

        if ($request->name) {
            $this->validate($request, [

                'name' => 'string|min:8|required|max:60|profanity',

            ]);
            $user->name = request('name');
        }

        $user->save();

        return back()->with('success', __('You have successfully changed information'));
    }

}
