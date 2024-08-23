<?php

use Illuminate\Support\Facades\Route;
use Botble\Base\Facades\AdminHelper;

Route::group(['namespace' => 'Botble\QuizManager\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group(['prefix' => 'quiz-managers', 'as' => 'quiz-manager.'], function () {
            Route::resource('', 'QuizManagerController')->parameters(['' => 'quiz-manager']);
        });
        Route::group(['prefix' => 'papers', 'as' => 'paper.'], function () {
            Route::resource('', 'PaperController')->parameters(['' => 'paper']);
            Route::get('list', [
                'as' => 'list',
                'uses' => 'PaperController@getList',
                'permission' => 'paper.list',
            ]);
        });
        Route::group(['prefix' => 'questions', 'as' => 'question.'], function () {
            Route::resource('', 'QuestionController')->parameters(['' => 'question']);
        });
        Route::group(['prefix' => 'answers', 'as' => 'answer.'], function () {
            Route::resource('', 'AnswerController')->parameters(['' => 'answer']);
        });
    });
});
