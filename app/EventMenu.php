<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EventMenu extends Model
{
    public function items(){
        return $this->hasMany('App\EventMenuItem');
    }
    
    public function transaction(){
        return $this->belongsTo('App\Transaction');    
        
    }
    public function groceries()
    {
       return $this->hasMany(\App\Grocery::class,'event_menu_id');
    }
}
