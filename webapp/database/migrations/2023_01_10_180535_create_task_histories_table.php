<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('task_histories', function (Blueprint $table) {
            $table->id();
            $table->foreignId("task_id")->constrained("tasks");
            $table->foreignId("user_id")->constrained("users");
            $table->dateTime("attached_at");
            $table->dateTime("detached_at")->nullable();
            $table->unique(["task_id", "detached_at","user_id"], 'user_task_detach');
            $table->unique(["task_id", "attached_at","user_id"], 'user_task_attach');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('task_histories');
    }
};
