<?php

namespace Botble\QuizManager\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FieldOptions\DescriptionFieldOption;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\FormAbstract;
use Botble\QuizManager\Http\Requests\PaperRequest;
use Botble\QuizManager\Models\Paper;
use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;
use Botble\QuizManager\Enums\PaperStatusEnum;
use Botble\QuizManager\Enums\PaperTypeEnum;
use Botble\Base\Facades\Assets;

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
        Assets::addScriptsDirectly([
            'vendor/core/plugins/quiz-manager/js/quiz-manager.js'
        ]);

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
            ->add('paper_type', 'customSelect', [
                'label' => trans('Paper Type'),
                'required' => true,
                'choices' => PaperTypeEnum::labels(),
                'attr' => [
                    'class' => 'form-control',
                    'id' => 'paper_type',
                    'data-toggle-targets' => '#paper_status, #price, #time, #attempts',
                    'data-visible-statuses' => PaperTypeEnum::MOCKTEST(),
                ],
                'wrapper' => [
                    'class' => 'form-group',
                ],
            ])
            ->add('description', 'text', [
                'label' => trans('Short description of paper'),
                    'attr' => [
                        'class' => 'form-control',
                        'id' => 'description',
                    ],
                    'wrapper' => [
                        'class' => 'form-group',
                    ],
            ])
            ->add('paper_status', 'customSelect', [
                'label' => trans('Paper Status'),
                'required' => true,
                'choices' => PaperStatusEnum::labels(),
                'attr' => [
                    'class' => 'form-control',
                    'id' => 'paper_status',
                    'data-toggle-target' => '#price, #attempts',
                    'data-visible-statuses' => PaperStatusEnum::BUY(),
                ],
                'wrapper' => [
                    'class' => 'form-group',
                ],
            ])
            ->add('price', 'number', [
                'label' => trans('Enter price'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => trans('Enter price'),
                    'id' => 'price',
                ],
                'wrapper' => [
                    'class' => 'form-group',
                ],
            ])
            ->add('allowed_attempts', 'number', [
                'label' => trans('Enter paper attempts per payment'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => trans('Allowed attempts per payment'),
                    'id' => 'attempts',
                ],
                'wrapper' => [
                    'class' => 'form-group',
                ],
            ])
            ->add('time', 'number', [
                'label' => trans('Time for paper (minutes)'),
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => trans('Enter time in minutes'),
                    'id' => 'time'
                ],
                'wrapper' => [
                    'class' => 'form-group',
                ],
            ])
            ->add('marks_per_question', 'number', [
                'label' => trans('Mark per question'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => trans('Enter mark for each question'),
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
