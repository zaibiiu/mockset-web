<?php

namespace Botble\QuizManager\Tables;

use Botble\QuizManager\Models\Question;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\Columns\NameColumn;
use Illuminate\Database\Eloquent\Builder;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\NameBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;

class QuestionTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Question::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('question.create'))
            ->addActions([
                EditAction::make()->route('question.edit'),
                DeleteAction::make()->route('question.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                Column::make('subject')
                    ->title(trans('Subject'))
                    ->width(100),
                Column::make('paper')
                    ->title(trans('Paper'))
                    ->width(100),
                Column::make('question')
                    ->title(trans('Question'))
                    ->width(100),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('question.destroy'),
            ])
            ->addBulkChanges([
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                $query->select([
                    'questions.id',
                    'subject.name as subject',
                    'paper.name as paper',
                    'questions.question',
                    'questions.created_at',
                    'questions.status',
                ])
                    ->join('quiz_managers as subject', 'questions.quiz_manager_id', '=', 'subject.id')
                    ->join('papers as paper', 'questions.paper_id', '=', 'paper.id');
            });
    }
}
