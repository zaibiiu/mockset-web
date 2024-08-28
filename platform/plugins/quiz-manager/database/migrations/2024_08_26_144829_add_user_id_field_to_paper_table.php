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
        Schema::table('papers', function (Blueprint $table) {
            // Adding user_id column with foreign key constraint
            $table->foreignIdFor(\Botble\ACL\Models\User::class, 'user_id')->nullable()->constrained('users')->nullOnDelete();

            // Adding price column to store the cost of the paper
            $table->decimal('price', 8, 2)->nullable()->after('user_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('papers', function (Blueprint $table) {
            // Dropping the user_id column and its foreign key constraint
            $table->dropForeign(['user_id']);
            $table->dropColumn('user_id');

            // Dropping the price column
            $table->dropColumn('price');
        });
    }
};
