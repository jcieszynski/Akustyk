<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravelista\Comments\Commenter;

class User extends \TCG\Voyager\Models\User implements MustVerifyEmail
{
    use Notifiable, Commenter;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'provider', 'provider_id', 'avatar', 'email_verified_at', 'last_login'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'provider_id'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public static function getAvatarPath($id)
    {
        $user = \DB::table('users')->where('id', $id)->first();
        if ($user) {
            if (strpos($user->avatar, 'users')) {
                $avatarPath = (\Voyager::image($user->avatar));
                return $avatarPath;
            }
            return $user->avatar;
        } else return false;

    }
}
