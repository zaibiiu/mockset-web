<?php

use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Theme::registerRoutes(function () {

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
            Route::get('paper/{paper_id}/quiz', [
               'as' => 'quiz_list',
               'uses' => 'PublicQuizManagerController@getQuizList',
               'permission' => 'paper_quiz.list',
            ]);
            Route::get('paper/{paper_id}/instruction', [
                'as' => 'paper_instruction',
                'uses' => 'PublicQuizManagerController@getInstructions',
                'permission' => 'paper_instruction.view',
           ]);
            Route::post('paper/{paper_id}/submit-score', [
                'as' => 'paper_submit_score',
                'uses' => 'PublicQuizManagerController@submitScore',
                'permission' => 'paper_score.submit',
           ]);
           Route::get('user/papers', [
               'as' => 'user_papers',
               'uses' => 'PublicQuizManagerController@viewUserPapers',
               'permission' => 'user_papers.view',
           ]);
    });
});

Theme::routes();
