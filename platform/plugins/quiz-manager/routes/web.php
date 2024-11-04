<?php

use Illuminate\Support\Facades\Route;
use Botble\Base\Facades\AdminHelper;
use Botble\QuizManager\Models\Paper;

Route::group(['namespace' => 'Botble\QuizManager\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group(['prefix' => 'quiz-managers', 'as' => 'quiz-manager.'], function () {
            Route::resource('', 'QuizManagerController')->parameters(['' => 'quiz-manager']);
        });
        Route::group(['prefix' => 'chapters', 'as' => 'chapter.'], function () {
            Route::resource('', 'ChapterController')->parameters(['' => 'chapter']);
            Route::get('list', [
                'as' => 'list',
                'uses' => 'ChapterController@getList',
                'permission' => 'chapter.list',
            ]);
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
            Route::get('list', [
                'as' => 'list',
                'uses' => 'QuestionController@getList',
                'permission' => 'question.list',
            ]);
        });
        Route::group(['prefix' => 'answers', 'as' => 'answer.'], function () {
            Route::resource('', 'AnswerController')->parameters(['' => 'answer']);
        });
        Route::group(['prefix' => 'scores', 'as' => 'score.'], function () {
            Route::resource('', 'ScoreController')->parameters(['' => 'score']);
        });
    });

    Route::group(['middleware' => ['web', 'member']], function () {

        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            //papers
            Route::prefix('papers')->group(function () {

                Route::get(SlugHelper::getPrefix(Paper::class, 'payment-success') . '/{id}', 'PublicQuizManagerController@paymentCallback')->name('public.paper.payment');

                Route::post(SlugHelper::getPrefix(Paper::class, 'payment') . '/{id}', 'PublicQuizManagerController@makePayment')->name('public.paper.make-payment');

                Route::get(SlugHelper::getPrefix(Paper::class, 'payment-cancel') . '/{id}', 'PublicQuizManagerController@paymentCancel')->name('public.paper.cancel');

            });
        });
    });
});
