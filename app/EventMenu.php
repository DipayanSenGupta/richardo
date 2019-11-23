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
       return $this->hasMany(Grocery::class,'event_menu_id');
    }
    public function menuItems()
    {
       return $this->hasMany(MenuItem::class,'event_menu_id');
    }
}
