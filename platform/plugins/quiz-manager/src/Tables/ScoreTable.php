<?php

namespace Botble\QuizManager\Tables;

use Botble\QuizManager\Models\Score;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\YesNoColumn;
use Illuminate\Database\Eloquent\Builder;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;

class ScoreTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Score::class)
            ->addActions([
                DeleteAction::make()->route('score.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                Column::make('member')
                    ->title(trans('Member'))
                    ->width(150), // Adjust width if needed
                Column::make('paper')
                    ->title(trans('Paper'))
                    ->width(150), // Adjust width if needed
                Column::make('user_score')
                    ->title(trans('User Score'))
                    ->width(100),
                YesNoColumn::make('status')
                    ->title(trans('Pass the Exam ?'))
                    ->width(100),
                CreatedAtColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('score.destroy'),
            ])
            ->addBulkChanges([
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                $query->select([
                    'paper_scores.id',
                    \DB::raw("CONCAT(members.first_name, ' ', members.last_name) AS member"),
                    'papers.name AS paper',
                    'paper_scores.user_score',
                    'paper_scores.status',
                    'paper_scores.created_at',
                ])
                    ->join('members', 'paper_scores.member_id', '=', 'members.id')
                    ->join('papers', 'paper_scores.paper_id', '=', 'papers.id');
            });
    }
}
