<?php

namespace Botble\QuizManager\Facades;
/*
* File Name: Rental.php
* User: Muhammad Yasir
* Project: car-rental
* Date Time: 20/10/2023 11:31
*/

use Botble\QuizManager\Supports\QuizManager as QuizManagerHelper;
use Illuminate\Support\Facades\Facade;

class QuizManager extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return QuizManagerHelper::class;
    }
}
