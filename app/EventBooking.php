<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EventBooking extends Model
{
    public function eventMenu(){
        return $this->belongsTo('App\EventMenu');     
    }
    
    public function business(){
        return $this->belongsTo('App\Business');     
    }
}
