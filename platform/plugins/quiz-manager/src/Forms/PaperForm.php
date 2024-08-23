<?php

namespace Botble\QuizManager\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\QuizManager\Http\Requests\PaperRequest;
use Botble\QuizManager\Models\Paper;
use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;

class PaperForm extends FormAbstract
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
            ->setupModel(new Paper())
            ->setValidatorClass(PaperRequest::class)
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
                'label' => trans('Paper'),
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
