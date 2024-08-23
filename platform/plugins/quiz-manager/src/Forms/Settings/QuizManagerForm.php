<?php

namespace Botble\QuizManager\Forms\Settings;

use Botble\QuizManager\Http\Requests\Settings\QuizManagerRequest;
use Botble\Setting\Forms\SettingForm;

class QuizManagerForm extends SettingForm
{
    public function buildForm(): void
    {
        parent::buildForm();

        $this
            ->setSectionTitle('Setting title')
            ->setSectionDescription('Setting description')
            ->setValidatorClass(QuizManagerRequest::class);
    }
}
