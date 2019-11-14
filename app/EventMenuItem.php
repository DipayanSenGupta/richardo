<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EventMenuItem extends Model
{
    public function menu(){
        return $this->belongsTo('App\EventMenu');
    }
}
