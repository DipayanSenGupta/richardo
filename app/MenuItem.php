<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MenuItem extends Model
{
    public function eventMenu()
    {
        return $this->belongsTo(EventMenu::class);
    }
}
