<?php

use Botble\Base\Http\Middleware\RequiresJsonRequestMiddleware;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;
use Theme\Ripple\Http\Controllers\RippleController;

Theme::registerRoutes(function () {
    Route::group(['controller' => RippleController::class], function () {
        Route::middleware(RequiresJsonRequestMiddleware::class)
            ->group(function () {
                Route::get('ajax/search', 'getSearch')->name('public.ajax.search');
            });

        // Add your custom route here
        // Ex: Route::get('hello', 'getHello');
    });
    Route::group(['namespace' => 'Botble\QuizManager\Http\Controllers'], function () {
            Route::get('subject/{subject_id}/papers', [
               'as' => 'subject_list',
               'uses' => 'PublicQuizManagerController@getList',
               'permission' => 'subject_paper.list',
           ]);
            Route::get('paper/{paper_id}/question', [
                'as' => 'paper_list',
                'uses' => 'PublicQuizManagerController@getQuestions',
                'permission' => 'paper_question.list',
            ]);
            Route::get('paper/{paper_id}/instruction', [
                'as' => 'paper_instruction',
                'uses' => 'PublicQuizManagerController@getInstructions',
                'permission' => 'paper_instruction.view',
           ]);
    });
});

Theme::routes();
