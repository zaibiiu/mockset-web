<?php

namespace Botble\QuizManager\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\QuizManager\Http\Requests\PaperRequest;
use Botble\QuizManager\Models\Paper;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Http\Controllers\BaseController;
use Botble\QuizManager\Tables\PaperTable;
use Botble\QuizManager\Forms\PaperForm;
use Botble\QuizManager\Http\Resources\PaperResource;
use Botble\QuizManager\Repositories\Interfaces\PaperInterface;
use Illuminate\Http\Request;

class PaperController extends BaseController
{
    protected PaperInterface $repository;

    public function __construct(PaperInterface $repository)
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('Papers')), route('paper.index'));

        $this->repository = $repository;
    }

    public function index(PaperTable $table)
    {
        $this->pageTitle(trans('Papers'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('New Paper'));

        return PaperForm::create()->renderForm();
    }

    public function store(PaperRequest $request)
    {
        $form = PaperForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('paper.index'))
            ->setNextUrl(route('paper.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(Paper $paper)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $paper->name]));

        return PaperForm::createFromModel($paper)->renderForm();
    }

    public function update(Paper $paper, PaperRequest $request)
    {
        PaperForm::createFromModel($paper)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('paper.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(Paper $paper)
    {
        return DeleteResourceAction::make($paper);
    }

    public function getList(BaseHttpResponse $response, Request $request)
    {
        $data = $this->repository->allBy(['quiz_manager_id' => $request->get('id')]);

        return $response->setData(PaperResource::collection($data));
    }

}
