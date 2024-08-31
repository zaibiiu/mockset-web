<?php

namespace Botble\QuizManager\Tables;

use Botble\QuizManager\Models\Answer;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\Column;
use Illuminate\Database\Eloquent\Builder;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;

class AnswerTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Answer::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('answer.create'))
            ->addActions([
                EditAction::make()->route('answer.edit'),
                DeleteAction::make()->route('answer.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                Column::make('question')
                    ->title(trans('Question'))
                    ->width(100),
                Column::make('answer_1')
                    ->title(trans('Answer 1'))
                    ->width(100),
                Column::make('answer_2')
                    ->title(trans('Answer 2'))
                    ->width(100),
                Column::make('answer_3')
                    ->title(trans('Answer 3'))
                    ->width(100),
                Column::make('answer_4')
                    ->title(trans('Answer 4'))
                    ->width(100),
                CreatedAtColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('answer.destroy'),
            ])
            ->addBulkChanges([
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                $query->select([
                    'answers.id',
                    'questions.question as question',
                    'answers.answer_1',
                    'answers.answer_2',
                    'answers.answer_3',
                    'answers.answer_4',
                    'answers.created_at',
                ])
                    ->join('questions', 'answers.question_id', '=', 'questions.id');
            });
    }
}
