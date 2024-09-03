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
        Schema::table('paper_scores', function (Blueprint $table) {
            $table->foreignId('quiz_manager_id')->nullable()->constrained('quiz_managers')->nullOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('paper_scores', function (Blueprint $table) {
            //
        });
    }
};
