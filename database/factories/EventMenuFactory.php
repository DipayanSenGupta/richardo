<?php

use Faker\Generator as Faker;

$factory->define(App\EventMenu::class, function (Faker $faker) {
    return [
        'name' => $faker->colorName(),
        'type' =>$faker->state .' holiday',
        'venue' => $faker->address,
        'attendences' => rand(100,1000),    
        'booking_time' => $faker->dateTime(\Carbon::now(),null),    
        'event_time' => $faker->dateTime(\Carbon::now(),null)
    ];
});
