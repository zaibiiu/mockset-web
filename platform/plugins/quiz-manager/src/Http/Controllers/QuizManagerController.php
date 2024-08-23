<?php

namespace Botble\QuizManager\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\QuizManager\Http\Requests\QuizManagerRequest;
use Botble\QuizManager\Models\QuizManager;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Http\Controllers\BaseController;
use Botble\QuizManager\Tables\QuizManagerTable;
use Botble\QuizManager\Forms\QuizManagerForm;

class QuizManagerController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('Subjects')), route('quiz-manager.index'));
    }

    public function index(QuizManagerTable $table)
    {
        $this->pageTitle(trans('Subjects'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('New Subject'));

        return QuizManagerForm::create()->renderForm();
    }

    public function store(QuizManagerRequest $request)
    {
        $form = QuizManagerForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('quiz-manager.index'))
            ->setNextUrl(route('quiz-manager.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(QuizManager $quizManager)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $quizManager->name]));

        return QuizManagerForm::createFromModel($quizManager)->renderForm();
    }

    public function update(QuizManager $quizManager, QuizManagerRequest $request)
    {
        QuizManagerForm::createFromModel($quizManager)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('quiz-manager.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(QuizManager $quizManager)
    {
        return DeleteResourceAction::make($quizManager);
    }
}
