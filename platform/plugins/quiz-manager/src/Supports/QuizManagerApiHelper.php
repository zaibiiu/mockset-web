<?php
/*
* File Name: RentalApiHelper.php
* User: Muhammad Yasir
* Project: nomad-rms
* Date Time: 24/07/2024 10:56
*/

namespace Botble\QuizManager\Supports;

use Botble\Api\Supports\ApiHelper;

class QuizManagerApiHelper extends ApiHelper
{
    public function getConfig(string $key, $default = null): string|null
    {
        return config('plugins.quiz-manager.api.provider.' . $key, $default);
    }
}
