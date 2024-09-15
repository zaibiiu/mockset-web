<?php

namespace Botble\QuizManager\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\Assets;
use Botble\Base\Forms\FormAbstract;
use Botble\QuizManager\Http\Requests\QuestionRequest;
use Botble\QuizManager\Models\Question;
use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;

class QuestionForm extends FormAbstract
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

        $papers = [];
        if ($this->getModel() && $this->getModel()->paper) {
            $papers[$this->getModel()->paper->id] = $this->getModel()->paper->name;
        }

        $this
            ->setupModel(new Question())
            ->setValidatorClass(QuestionRequest::class)
            ->withCustomFields()
            ->add('quiz_manager_id', 'customSelect', [
                'label' => trans('Select subject'),
                'required' => true,
                'attr' => [
                    'class' => 'select-search-full form-control ays-ignore dependent',
                    'data-dependent' => 'paper_id',
                    'data-url' => route('paper.list'),
                    'id' => 'quiz_manager_id',
                ],
                'choices' => ['' => 'Locate'] + $subjects,
            ])
            ->add('paper_id', 'customSelect', [
                'label' => trans('Select paper'),
                'label_attr' => ['class' => 'control-label'],
                'attr' => [
                    'class' => 'select-search-full form-control ays-ignore',
                ],
                'choices' => ['' => 'Locate'] + $papers,
            ])
            ->add('question', 'text', [
                'label' => trans('Question'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => trans('Enter the question'),
                ],
                'wrapper' => [
                    'class' => 'form-group col-md-12',
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
