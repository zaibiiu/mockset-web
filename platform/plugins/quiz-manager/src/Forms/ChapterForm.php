<?php

namespace Botble\QuizManager\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\QuizManager\Http\Requests\ChapterRequest;
use Botble\QuizManager\Models\Chapter;
use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;

class ChapterForm extends FormAbstract
{
    public function __construct(
        protected QuizManagerInterface $subjectRepository,
    )
    {
        parent::__construct();
    }

    public function setup(): void
    {
        $subjects = $this->subjectRepository->pluck('name', 'id');

        $this
            ->setupModel(new Chapter())
            ->setValidatorClass(ChapterRequest::class)
            ->withCustomFields()
            ->add('quiz_manager_id', 'customSelect', [
                'label' => trans('Select subject'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control ays-ignore dependent',
                ],
                'choices' => ['' => 'Locate'] + $subjects,
            ])
            ->add('name', 'text', [
                'label' => trans('Chapter name'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('status', 'customSelect', [
                'label' => trans('core/base::tables.status'),
                'required' => true,
                'choices' => BaseStatusEnum::labels(),
            ])
            ->setBreakFieldPoint('status');
    }
}
