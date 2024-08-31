<?php

namespace Botble\Payment\Repositories\Caches;

use Botble\Payment\Repositories\Interfaces\PaymentGatewaySettingInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

class PaymentGatewaySettingCacheDecorator extends CacheAbstractDecorator implements PaymentGatewaySettingInterface
{
}
