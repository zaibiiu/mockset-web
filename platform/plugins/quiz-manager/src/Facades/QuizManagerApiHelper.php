<?php
/*
* File Name: RentalApiHelper.php
* User: Muhammad Yasir
* Project: nomad-rms
* Date Time: 24/07/2024 11:02
*/

namespace Botble\QuizManager\Facades;

use Botble\QuizManager\Supports\QuizManagerApiHelper as QuizManagerApiHelperSupport;
use Illuminate\Support\Facades\Facade;

class QuizManagerApiHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return QuizManagerApiHelperSupport::class;
    }
}
