<?php

namespace Botble\QuizManager\Providers;

use Botble\Payment\Models\Payment;
use Botble\Payment\Supports\PaymentHelper;
use Botble\RealEstate\Repositories\Interfaces\PackageInterface;
use Botble\Rental\Supports\InvoiceHelper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;
use Botble\Base\Facades\Form;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\ServiceProvider;
use Botble\Member\Models\Member;
use Botble\Base\Facades\MetaBox;

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
                        'paper' => $data['paper']->id,
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


            if (defined('PAYMENT_FILTER_PAYMENT_PARAMETERS')) {
                add_filter(PAYMENT_FILTER_PAYMENT_PARAMETERS, function ($html) {
                    if (!auth('member')->check()) {
                        return $html;
                    }

                    return $html . Form::hidden('customer_id', auth('member')->id())->toHtml() .
                        Form::hidden('customer_type', Member::class)->toHtml();
                }, 123);
            }

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

                            if (!$package) {
                                return null;
                            }

                            return view('plugins/real-estate::partials.payment-extras', compact('package'));
                        }, get_class($payment), $context);
                    }
                }, 128, 2);
            }

        });

    }

}
