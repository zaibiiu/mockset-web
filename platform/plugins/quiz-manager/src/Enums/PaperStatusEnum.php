<?php

namespace Botble\QuizManager\Enums;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static Free FREE()
 * @method static Buy BUY()
 **/
class PaperStatusEnum extends Enum
{
    public const FREE = 'free';
    public const BUY = 'buy';

    public static $langPath = 'plugins/quiz-manager::quiz-manager.paper_types';

    public function toHtml(): HtmlString|string
    {
        return match ($this->value) {
            self::FREE => Html::tag('span', self::FREE()->label(), ['class' => 'badge bg-success text-success-fg']),
            self::BUY => Html::tag('span', self::BUY()->label(), ['class' => 'badge bg-warning text-warning-fg']),
        };
    }
}
