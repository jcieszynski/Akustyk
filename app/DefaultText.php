<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class DefaultText extends Model
{
    use Translatable;

    public $table = 'default_text';
    public $fillable = ['header', 'text'];
    protected $translatable = ['header', 'text'];
}
