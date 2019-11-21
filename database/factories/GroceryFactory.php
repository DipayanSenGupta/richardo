<?php

use Faker\Generator as Faker;

$factory->define(App\Grocery::class, function (Faker $faker) {
    return [
        'name' => $faker->colorName(),
        'quantity' => rand(1,100),
    ];
});
