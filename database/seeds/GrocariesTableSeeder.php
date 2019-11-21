<?php

use Illuminate\Database\Seeder;

class GrocariesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(App\::class)->create();
        for ($x = 0; $x <= 5; $x++) {
            $eventMenu = factory(App\EventMenu::class)->create();
            factory(App\Grocery::class, 15)->create(['event_menu_id' => $eventMenu->id]);        
        }    
    }
}
