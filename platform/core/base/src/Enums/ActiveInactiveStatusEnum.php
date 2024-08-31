<?php

namespace Botble\Base\Enums;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static BaseStatusEnum ACTIVE()
 * @method static BaseStatusEnum DISABLED()
 */
class ActiveInactiveStatusEnum extends Enum
{
    public const ACTIVE = 1;
    public const DISABLED = 0;

    public static $langPath = 'core/base::enums.active_inactive';

    public function toHtml(): string|HtmlString
    {
        return match ($this->value) {
            self::ACTIVE => Html::tag('span', self::ACTIVE()->label(), ['class' => 'label-info status-label'])
                ->toHtml(),
            self::DISABLED => Html::tag('span', self::DISABLED()->label(), ['class' => 'label-warning status-label'])
                ->toHtml(),
            default => parent::toHtml(),
        };
    }
}
