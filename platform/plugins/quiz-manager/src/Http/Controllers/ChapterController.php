<?php

namespace Botble\QuizManager\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\QuizManager\Http\Requests\ChapterRequest;
use Botble\QuizManager\Http\Resources\ChapterResource;
use Botble\QuizManager\Models\Chapter;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Http\Controllers\BaseController;
use Botble\QuizManager\Repositories\Interfaces\ChapterInterface;
use Botble\QuizManager\Tables\ChapterTable;
use Botble\QuizManager\Forms\ChapterForm;
use Illuminate\Http\Request;

class ChapterController extends BaseController
{
    protected ChapterInterface $repository;

    public function __construct(ChapterInterface $repository)
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('chapters')), route('chapter.index'));

        $this->repository = $repository;
    }

    public function index(ChapterTable $table)
    {
        $this->pageTitle(trans('Chapters'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('New Chapter'));

        return ChapterForm::create()->renderForm();
    }

    public function store(ChapterRequest $request)
    {
        $form = ChapterForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('chapter.index'))
            ->setNextUrl(route('chapter.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(Chapter $chapter)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $chapter->name]));

        return ChapterForm::createFromModel($chapter)->renderForm();
    }

    public function update(Chapter $chapter, ChapterRequest $request)
    {
        ChapterForm::createFromModel($chapter)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('chapter.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(Chapter $chapter)
    {
        return DeleteResourceAction::make($chapter);
    }

    public function getList(BaseHttpResponse $response, Request $request)
    {
        $data = $this->repository->allBy(['quiz_manager_id' => $request->get('id')]);

        return $response->setData(ChapterResource::collection($data));
    }

}
