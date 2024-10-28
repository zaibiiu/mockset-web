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
        // Modify the 'questions' table
        Schema::table('questions', function (Blueprint $table) {
            $table->longText('question')->nullable()->change(); // Change 'question' field to longText
        });

        // Modify the 'answers' table
        Schema::table('answers', function (Blueprint $table) {
            $table->longText('answer_1')->nullable()->change(); // Change 'answer_1' field to longText
            $table->longText('answer_2')->nullable()->change(); // Change 'answer_2' field to longText
            $table->longText('answer_3')->nullable()->change(); // Change 'answer_3' field to longText
            $table->longText('answer_4')->nullable()->change(); // Change 'answer_4' field to longText
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Reverse the changes made to the 'questions' table
        Schema::table('questions', function (Blueprint $table) {
            $table->string('question')->nullable()->change(); // Revert 'question' field to string
        });

        // Reverse the changes made to the 'answers' table
        Schema::table('answers', function (Blueprint $table) {
            $table->string('answer_1')->nullable()->change(); // Revert 'answer_1' field to string
            $table->string('answer_2')->nullable()->change(); // Revert 'answer_2' field to string
            $table->string('answer_3')->nullable()->change(); // Revert 'answer_3' field to string
            $table->string('answer_4')->nullable()->change(); // Revert 'answer_4' field to string
        });
    }
};
