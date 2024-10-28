<?php

namespace Botble\QuizManager\Providers;

use Illuminate\Support\Str;
use Razorpay\Api\Api;
use Botble\Base\Facades\Form;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Models\Payment;
use Botble\Payment\Supports\PaymentHelper;
use Botble\RealEstate\Enums\InvoiceStatusEnum;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Models\Package;
use Botble\Member\Repositories\Interfaces\MemberInterface;
use Botble\RealEstate\Repositories\Interfaces\PackageInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;
use Botble\Base\Facades\MetaBox;
use Botble\Member\Models\Member;
use Exception;


class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->app->booted(function () {
            if (defined('PAYMENT_FILTER_PAPER_PAYMENT_DATA')) {
                add_filter(PAYMENT_FILTER_PAPER_PAYMENT_DATA, function (array $data, Request $request) {

                    $member = auth('member')->user();

                    $orderIds = [$data['paper']->id];

                    $products = [
                        [
                            'id' => $data['paper']->id,
                            'name' => $data['paper']->name,
                            'price' => $data['paper']->price,
                            'price_per_order' => $data['paper']->price,
                            'qty' => 1,
                        ],
                    ];

                    $address = [
                        'name' => $member->name,
                        'email' => $member->email,
                        'phone' => $member->phone,
                    ];

                    return [
                        'payment_id' => $data['paper']->id,
                        'amount' => (float) $data['amount'],
                        'currency' => strtoupper(get_application_currency()->title),
                        'order_id' => $data['paper']->id,
                        'description' => trans('plugins/payment::payment.payment_description', [
                            'order_id' => Arr::first($orderIds),
                            'site_url' => request()->getHost(),
                        ]),
                        'customer_id' => $member->id,
                        'customer_type' => get_class($member),
                        'return_url' => $data['return_url'],
                        'callback_url' => $data['callback_url'],
                        'products' => $products,
                        'orders' => [$data['paper']],
                        'address' => $address,
                        'checkout_token' => $data['paper']->id,
                    ];
                }, 120, 2);
            }
        });

        if (defined('PAYMENT_ACTION_PAPER_PAYMENT_PROCESSED')) {
            add_action(PAYMENT_ACTION_PAPER_PAYMENT_PROCESSED, function ($data) {
                $payment = PaymentHelper::storeLocalPayment($data);

                if ($payment instanceof Model) {
                    MetaBox::saveMetaBoxData($payment, 'subscribed_packaged_id', session('subscribed_packaged_id'));
                }
            }, 123);

            add_action(BASE_ACTION_META_BOXES, function ($context, $payment) {
                if (get_class($payment) == Payment::class && $context == 'advanced' && Route::currentRouteName() == 'payments.show') {
                    MetaBox::addMetaBox('additional_payment_data', __('Package information'), function () use ($payment) {
                        $subscribedPackageId = MetaBox::getMetaData($payment, 'subscribed_packaged_id', true);

                        $package = app(PackageInterface::class)->findById($subscribedPackageId);

                        if (!$package) {
                            return null;
                        }

                        return view('plugins/real-estate::partials.payment-extras', compact('package'));
                    }, get_class($payment), $context);
                }
            }, 128, 2);
        }

//        if (defined('PAYMENT_FILTER_PAYMENT_PARAMETERS')) {
//            add_filter(PAYMENT_FILTER_PAYMENT_PARAMETERS, function ($html) {
//                $apiKey = get_payment_setting('key', RAZORPAY_PAYMENT_METHOD_NAME);
//                $apiSecret = get_payment_setting('secret', RAZORPAY_PAYMENT_METHOD_NAME);
//
//                if (!$apiKey || !$apiSecret) {
//                    return $html; // Return if keys are not set
//                }
//
//                try {
//                    // Create a Razorpay order
//                    $api = new Api($apiKey, $apiSecret);
//                    $receiptId = Str::random(20);
//                    $amount = 1000; // Set the amount (in paise, e.g., 1000 for ₹10)
//                    $order = $api->order->create([
//                        'receipt' => $receiptId,
//                        'amount' => $amount,
//                        'currency' => 'INR',
//                    ]);
//
//                    // Fetch the order ID
//                    $razorpayOrderId = $order['id'];
//
//                    // Append the hidden fields to the HTML
//                    $html .= Form::hidden('razorpay_order_id', $razorpayOrderId)->toHtml();
//                    $html .= Form::hidden('razorpay_signature', '')->toHtml(); // Placeholder for signature
//                    $html .= Form::hidden('razorpay_payment_id', '')->toHtml(); // Placeholder for payment ID
//
//                    return $html;
//                } catch (Exception $exception) {
//                    info($exception->getMessage()); // Log error
//                    return $html; // Return HTML without the Razorpay order ID in case of error
//                }
//            }, 123);
//        }



        if (defined('PAYMENT_ACTION_PAYMENT_PROCESSED')) {
            add_action(PAYMENT_ACTION_PAYMENT_PROCESSED, function ($data) {
                $payment = PaymentHelper::storeLocalPayment($data);

                if ($payment instanceof Model) {
                    MetaBox::saveMetaBoxData($payment, 'subscribed_packaged_id', session('subscribed_packaged_id'));
                }
            }, 123);

            add_action(BASE_ACTION_META_BOXES, function ($context, $payment) {
                if (get_class($payment) == Payment::class && $context == 'advanced' && Route::currentRouteName() == 'payments.show') {
                    MetaBox::addMetaBox('additional_payment_data', __('Package information'), function () use ($payment) {
                        $subscribedPackageId = MetaBox::getMetaData($payment, 'subscribed_packaged_id', true);

                        $package = app(PackageInterface::class)->findById($subscribedPackageId);

                        if (! $package) {
                            return null;
                        }

                        return view('plugins/real-estate::partials.payment-extras', compact('package'));
                    }, get_class($payment), $context);
                }
            }, 128, 2);
        }

        if (defined('PAYMENT_FILTER_REDIRECT_URL')) {
            add_filter(PAYMENT_FILTER_REDIRECT_URL, function ($checkoutToken) {
                $checkoutToken = $checkoutToken ?: session('subscribed_packaged_id');

                if (! $checkoutToken) {
                    return route('public.index');
                }

                if (str_contains($checkoutToken, url(''))) {
                    return $checkoutToken;
                }

                return route('public.account.package.subscribe.callback', $checkoutToken);
            }, 123);
        }

        if (defined('PAYMENT_FILTER_CANCEL_URL')) {
            add_filter(PAYMENT_FILTER_CANCEL_URL, function ($checkoutToken) {
                $checkoutToken = $checkoutToken ?: session('subscribed_packaged_id');

                if (! $checkoutToken) {
                    return route('public.index');
                }

                if (str_contains($checkoutToken, url(''))) {
                    return $checkoutToken;
                }

                return route('public.account.package.subscribe', $checkoutToken) . '?' . http_build_query(['error' => true, 'error_type' => 'payment']);
            }, 123);
        }

        if (defined('ACTION_AFTER_UPDATE_PAYMENT')) {
            add_action(ACTION_AFTER_UPDATE_PAYMENT, function ($request, $payment) {
                if (in_array($payment->payment_channel, [PaymentMethodEnum::COD, PaymentMethodEnum::BANK_TRANSFER])
                    && $request->input('status') == PaymentStatusEnum::COMPLETED
                ) {
                    $subscribedPackageId = MetaBox::getMetaData($payment, 'subscribed_packaged_id', true);

                    if (! $subscribedPackageId) {
                        return;
                    }

                    $package = app(PackageInterface::class)->findById($subscribedPackageId);

                    if (! $package) {
                        return;
                    }

                    $account = app(MemberInterface::class)->findById($payment->customer_id);

                    if (! $account) {
                        return;
                    }

                    if ($payment->status == PaymentStatusEnum::PENDING) {
                        $account->credits += $package->number_of_listings;
                        $account->save();

                        $account->packages()->attach($package);
                    }

                    $payment->status = PaymentStatusEnum::COMPLETED;

                }
            }, 123, 2);
        }

    }

}
