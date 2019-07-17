<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ContactForm extends Model
{
    public $table = 'contact_forms';
    public $fillable  = ['user', 'email', 'message', 'ip_address','user_agent'];
}
