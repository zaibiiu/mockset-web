<?php

namespace Botble\QuizManager\Enums;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static MOCKTEST MOCKTEST()
 * @method static QUIZ QUIZ()
 **/
class PaperTypeEnum extends Enum
{
    public const MOCKTEST = 'mocktest';
    public const QUIZ = 'quiz';

    public static $langPath = 'plugins/quiz-manager::quiz-manager.paper_type';

    public function toHtml(): HtmlString|string
    {
        return match ($this->value) {
            self::MOCKTEST => Html::tag('span', self::MOCKTEST()->label(), ['class' => 'badge bg-success text-success-fg']),
            self::QUIZ => Html::tag('span', self::QUIZ()->label(), ['class' => 'badge bg-warning text-warning-fg']),
        };
    }

    public function getValue(): string
    {
        return $this->value;
    }
}
