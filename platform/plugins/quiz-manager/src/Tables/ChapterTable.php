<?php

namespace Botble\QuizManager\Tables;

use Botble\QuizManager\Models\Chapter;
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

class ChapterTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Chapter::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('chapter.create'))
            ->addActions([
                EditAction::make()->route('chapter.edit'),
                DeleteAction::make()->route('chapter.destroy'),
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
                DeleteBulkAction::make()->permission('chapter.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query->select([
                    'chapters.id',
                    'subject.name as subject',
                    'chapters.name',
                    'chapters.created_at',
                    'chapters.status',
                ])
                    ->join('quiz_managers as subject', 'chapters.quiz_manager_id', '=', 'subject.id');
            })
            ->onAjax(function (ChapterTable $table) {
                return $table->toJson(
                    $table->table->eloquent($table->query())->filter(function ($query) {
                        if ($keyword = $this->request->input('search.value')) {
                            $keyword = '%' . $keyword . '%';

                            return $query->where('chapters.name', 'LIKE', $keyword)
                                ->orWhere('subject.name', 'LIKE', $keyword);
                        }

                        return $query;
                    })
                );
            });
    }
}
