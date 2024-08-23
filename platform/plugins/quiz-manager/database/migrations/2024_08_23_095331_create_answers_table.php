<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('answers', function (Blueprint $table) {
            $table->id();
            $table->foreignId('question_id')
                ->nullable()
                ->constrained('questions')
                ->onDelete('cascade');
            $table->string('answer_1')->nullable();
            $table->boolean('is_answer_1')->default(0);
            $table->string('answer_2')->nullable();
            $table->boolean('is_answer_2')->default(0);
            $table->string('answer_3')->nullable();
            $table->boolean('is_answer_3')->default(0);
            $table->string('answer_4')->nullable();
            $table->boolean('is_answer_4')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('answers');
    }
};
