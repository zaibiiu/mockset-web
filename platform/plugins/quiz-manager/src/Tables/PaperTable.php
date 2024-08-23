<?php

namespace Botble\QuizManager\Tables;

use Botble\QuizManager\Models\Paper;
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

class PaperTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Paper::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('paper.create'))
            ->addActions([
                EditAction::make()->route('paper.edit'),
                DeleteAction::make()->route('paper.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                Column::make('subject')
                    ->title(trans('Subject'))
                    ->width(100),
                NameColumn::make(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('paper.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                $query->select([
                    'papers.id',
                    'subject.name as subject',
                    'papers.name',
                    'papers.created_at',
                    'papers.status',
                ])
                    ->join('quiz_managers as subject', 'papers.quiz_manager_id', '=', 'subject.id');
            });
    }
}
