<?php

namespace Botble\QuizManager\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\QuizManager\Http\Requests\AnswerRequest;
use Botble\QuizManager\Models\Answer;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Http\Controllers\BaseController;
use Botble\QuizManager\Tables\AnswerTable;
use Botble\QuizManager\Forms\AnswerForm;

class AnswerController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('Answers')), route('answer.index'));
    }

    public function index(AnswerTable $table)
    {
        $this->pageTitle(trans('Answers'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('New Answers'));

        return AnswerForm::create()->renderForm();
    }

    public function store(AnswerRequest $request)
    {
        $form = AnswerForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('answer.index'))
            ->setNextUrl(route('answer.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(Answer $answer)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $answer->name]));

        return AnswerForm::createFromModel($answer)->renderForm();
    }

    public function update(Answer $answer, AnswerRequest $request)
    {
        AnswerForm::createFromModel($answer)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('answer.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(Answer $answer)
    {
        return DeleteResourceAction::make($answer);
    }
}
