<?php

namespace Botble\QuizManager\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\QuizManager\Models\Paper;
use Botble\Base\Http\Controllers\BaseController;
use Botble\QuizManager\Tables\ScoreTable;
use Botble\QuizManager\Repositories\Interfaces\ScoreInterface;

class ScoreController extends BaseController
{
    protected ScoreInterface $repository;

    public function __construct(ScoreInterface $repository)
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('User Scores')), route('score.index'));

        $this->repository = $repository;
    }

    public function index(ScoreTable $table)
    {
        $this->pageTitle(trans('User Scores'));

        return $table->renderTable();
    }

    public function destroy(Paper $paper)
    {
        return DeleteResourceAction::make($paper);
    }

}
