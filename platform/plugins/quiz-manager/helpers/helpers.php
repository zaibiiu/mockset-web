<?php

use Botble\Base\Enums\BaseStatusEnum;
use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;

if (!function_exists('get_all_subjects')) {
    function get_all_subjects()
    {
        $subjects = app(QuizManagerInterface::class)
            ->allBy(
                ['status' => BaseStatusEnum::PUBLISHED],
                [],
                ['id', 'name', 'created_at'],
                ['created_at' => 'DESC']
            );
        return $subjects;
    }
}

