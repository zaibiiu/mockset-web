<?php

namespace Botble\QuizManager\Enums;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static PASS PASS()
 * @method static FAIL FAIL()
 **/
class UserPaperStatusEnum extends Enum
{
    public const PASS = 1;
    public const FAIL = 0;

    public static $langPath = 'plugins/quiz-manager::quiz-manager.user_paper_status';

    public function toHtml(): HtmlString|string|null
    {
        return match ($this->value) {
            self::PASS => Html::tag('span', self::PASS()->label(), ['class' => 'badge bg-success text-success-fg']),

            self::FAIL => Html::tag('span', self::FAIL()->label(), ['class' =>  'badge bg-warning text-warning-fg']),
            default => parent::toHtml(),
        };
    }
}
