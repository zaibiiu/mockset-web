<?php

namespace Botble\QuizManager\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\QuizManager\Http\Requests\QuestionRequest;
use Botble\QuizManager\Models\Question;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Http\Controllers\BaseController;
use Botble\QuizManager\Tables\QuestionTable;
use Botble\QuizManager\Forms\QuestionForm;

class QuestionController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('Pages and Questions')), route('question.index'));
    }

    public function index(QuestionTable $table)
    {
        $this->pageTitle(trans('Pages and Questions'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('New Page and Questions'));

        return QuestionForm::create()->renderForm();
    }

    public function store(QuestionRequest $request)
    {
        $form = QuestionForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('question.index'))
            ->setNextUrl(route('question.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(Question $question)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $question->name]));

        return QuestionForm::createFromModel($question)->renderForm();
    }

    public function update(Question $question, QuestionRequest $request)
    {
        QuestionForm::createFromModel($question)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('question.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(Question $question)
    {
        return DeleteResourceAction::make($question);
    }
}
