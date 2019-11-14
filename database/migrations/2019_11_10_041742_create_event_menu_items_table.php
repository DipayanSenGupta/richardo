<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventMenuItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_menu_items', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->unsignedInteger('event_menu_id');
            $table->foreign('event_menu_id')
            ->references('id')->on('event_menus')
            ->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_menu_items');
    }
}
