<?php

use Botble\Base\Models\BaseModel;
use Botble\Payment\Models\Payment;
use Botble\Stripe\Supports\StripeHelper;

if (!function_exists('convert_stripe_amount_from_api')) {
    function convert_stripe_amount_from_api(float $amount, ?BaseModel $currency): float
    {
        return $amount / StripeHelper::getStripeCurrencyMultiplier($currency);
    }
}

if (!function_exists('get_payment_setting')) {
    function get_payment_setting(string $key, $type = null, $default = null): ?string
    {
        if (!empty($type)) {
            $key = 'payment_' . $type . '_' . $key;
        } else {
            $key = 'payment_' . $key;
        }

        return setting($key, $default);
    }
}

if (!function_exists('get_payment_is_support_refund_online')) {
    function get_payment_is_support_refund_online(Payment $payment): bool|string
    {
        $paymentService = $payment->payment_channel->getServiceClass();

        if ($paymentService && class_exists($paymentService)) {
            if (method_exists($paymentService, 'getSupportRefundOnline')) {
                try {
                    $isSupportRefund = (new $paymentService())->getSupportRefundOnline();

                    return $isSupportRefund ? $paymentService : false;
                } catch (Exception) {
                    return false;
                }
            }
        }

        return false;
    }
}

if (!function_exists('payment_gateway_settings')) {
    function payment_gateway_settings(string $gateway)
    {
        return \Botble\Payment\Models\PaymentGatewaySetting::where('payment_gateway', $gateway)
            ->first();
    }
}

if (!function_exists('is_payment_gateway_active')) {
    function is_payment_gateway_active(string $gateway)
    {
        $gateway = payment_gateway_settings($gateway);
        if (empty($gateway)) return false;
        return (bool)$gateway->status->getValue();
    }
}
