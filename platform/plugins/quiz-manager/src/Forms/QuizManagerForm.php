<?php

namespace Botble\QuizManager\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\QuizManager\Http\Requests\QuizManagerRequest;
use Botble\QuizManager\Models\QuizManager;

class QuizManagerForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->setupModel(new QuizManager())
            ->setValidatorClass(QuizManagerRequest::class)
            ->withCustomFields()
            ->add('name', 'text', [
                'label' => trans('Subject'),
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
