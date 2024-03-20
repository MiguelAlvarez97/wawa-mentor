<?php

namespace App\Models;

class User_wm extends Model{
    protected $table = 'user_wm';
    protected $guarded = [];
    protected $hidden = ['CREATION_DATE', 'updated_at', 'UPDATED_AT_DATETIME'];
}



