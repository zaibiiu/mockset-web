<?php

namespace Botble\QuizManager\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\Assets;
use Botble\Base\Forms\FieldOptions\DescriptionFieldOption;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\FormAbstract;
use Botble\QuizManager\Http\Requests\AnswerRequest;
use Botble\QuizManager\Models\Answer;
use Botble\QuizManager\Repositories\Interfaces\QuestionInterface;

class AnswerForm extends FormAbstract
{
    public function __construct(
        protected QuestionInterface $questionRepository,
    )
    {
        parent::__construct();
    }

    public function setup(): void
    {
        Assets::addScriptsDirectly([
            'vendor/core/plugins/quiz-manager/js/quiz-manager.js'
        ]);

        $questions = $this->questionRepository->pluck('question', 'id');

        $this
            ->setupModel(new Answer())
            ->setValidatorClass(AnswerRequest::class)
            ->withCustomFields()
            ->add('question_id', 'customSelect', [
                'label' => trans('Select question'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control ays-ignore dependent',
                ],
                'choices' => ['' => 'Locate'] + $questions,
            ])
            ->add('row', 'html', [
                'html' => '<div class="row">'
            ])
            ->add('answer_1', 'text', [
                'label' => trans('Answer 1'),
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => trans('Enter answer 1'),
                ],
                'wrapper' => [
                    'class' => 'form-group col-md-9',
                ],
            ])
            ->add('is_answer_1', 'checkbox', [
                'label' => false,
                'label_attr' => ['class' => 'form-check-label'],
                'wrapper' => [
                    'class' => 'form-group col-md-3 mt-5',
                ],
                'attr' => [
                    'class' => 'form-check-input',
                    'value' => 1,
                ],
                'checked' => old('is_answer_1', $this->getModel()->is_answer_1 ?? 0) == 1,
            ])
            ->add('answer_2', 'text', [
                'label' => trans('Answer 2'),
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => trans('Enter answer 2'),
                ],
                'wrapper' => [
                    'class' => 'form-group col-md-9',
                ],
            ])
            ->add('is_answer_2', 'checkbox', [
                'label' => false,
                'label_attr' => ['class' => 'form-check-label'],
                'wrapper' => [
                    'class' => 'form-group col-md-3 mt-5',
                ],
                'attr' => [
                    'class' => 'form-check-input',
                    'value' => 1,
                ],
                'checked' => old('is_answer_2', $this->getModel()->is_answer_2 ?? 0) == 1,
            ])
            ->add('answer_3', 'text', [
                'label' => trans('Answer 3'),
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => trans('Enter answer 3'),
                ],
                'wrapper' => [
                    'class' => 'form-group col-md-9',
                ],
            ])
            ->add('is_answer_3', 'checkbox', [
                'label' => false,
                'label_attr' => ['class' => 'form-check-label'],
                'wrapper' => [
                    'class' => 'form-group col-md-3 mt-5',
                ],
                'attr' => [
                    'class' => 'form-check-input',
                    'value' => 1,
                ],
                'checked' => old('is_answer_3', $this->getModel()->is_answer_3 ?? 0) == 1,
            ])
            ->add('answer_4', 'text', [
                'label' => trans('Answer 4'),
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => trans('Enter answer 4'),
                ],
                'wrapper' => [
                    'class' => 'form-group col-md-9',
                ],
            ])
            ->add('is_answer_4', 'checkbox', [
                'label' => false,
                'label_attr' => ['class' => 'form-check-label'],
                'wrapper' => [
                    'class' => 'form-group col-md-3 mt-5',
                ],
                'attr' => [
                    'class' => 'form-check-input',
                    'value' => 1,
                ],
                'checked' => old('is_answer_4', $this->getModel()->is_answer_4 ?? 0) == 1,
            ])
            ->add('rowClose', 'html', [
                'html' => '</div>'
            ])
            ->add('description', TextareaField::class, DescriptionFieldOption::make()->toArray())
            ->setBreakFieldPoint('status');
    }
}
