<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('payment_gateway_settings', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('vendor_id');
            $table->foreign('vendor_id')
                ->references('id')->on('users') // Referencing the 'id' column in the 'users' table
                ->onDelete('cascade'); // Cascades the delete action
            $table->boolean('status')->default(false);
            $table->string('payment_gateway', 55);
            $table->string('name', 255);
            $table->string('payment_type', 55)->nullable();
            $table->boolean('mode')->comment('0:Sandbox, 1:Production');
            $table->string('client_key', 255)->comment('This may be client ID, Stripe Public Key, Key, Public Key, or Store ID');
            $table->string('client_secret', 255)->comment('This may be Stripe Private Key, Client Secret, Key, Secret, or Store Password (API/Secret key)');
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_gateway_settings');
    }
};
