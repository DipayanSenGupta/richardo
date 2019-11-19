<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Grocery extends Model
{
 public function eventMenu()
    {
        return $this->belongsTo(EventMenu::class);
    }
    
}
