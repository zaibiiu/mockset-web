<?php

namespace Botble\Payment\Models;

use Botble\ACL\Models\User;
use Botble\Base\Enums\ActiveInactiveStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PaymentGatewaySetting extends BaseModel
{
    protected $table = 'payment_gateway_settings';

    protected $fillable = [
        'vendor_id',
        'status',
        'payment_gateway',
        'name',
        'payment_type',
        'mode',
        'client_key',
        'client_secret',
        'description',
    ];

    protected $casts = [
        'status' => ActiveInactiveStatusEnum::class,
    ];

    public function vendor(): BelongsTo
    {
        return $this->belongsTo(User::class)->withDefault();
    }

    /**
     * Boot the model.
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function (PaymentGatewaySetting $model) {
            $model->vendor_id = \Auth::id();
            //$product->save();
        });
    }
}
