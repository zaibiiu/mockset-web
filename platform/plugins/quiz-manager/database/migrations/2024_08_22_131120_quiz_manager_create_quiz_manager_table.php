<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (! Schema::hasTable('quiz_managers')) {
            Schema::create('quiz_managers', function (Blueprint $table) {
                $table->id();
                $table->string('name', 255);
                $table->string('status', 60)->default('published');
                $table->timestamps();
            });
        }

        if (! Schema::hasTable('quiz_managers_translations')) {
            Schema::create('quiz_managers_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('quiz_managers_id');
                $table->string('name', 255)->nullable();

                $table->primary(['lang_code', 'quiz_managers_id'], 'quiz_managers_translations_primary');
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('quiz_managers');
        Schema::dropIfExists('quiz_managers_translations');
    }
};
