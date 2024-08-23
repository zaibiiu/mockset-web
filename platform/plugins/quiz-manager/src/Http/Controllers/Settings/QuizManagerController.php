<?php

namespace Botble\QuizManager\Http\Controllers\Settings;

use Botble\Base\Forms\FormBuilder;
use Botble\QuizManager\Forms\Settings\QuizManagerForm;
use Botble\QuizManager\Http\Requests\Settings\QuizManagerRequest;
use Botble\Setting\Http\Controllers\SettingController;

class QuizManagerController extends SettingController
{
    public function edit(FormBuilder $formBuilder)
    {
        $this->pageTitle('Page title');

        return $formBuilder->create(QuizManagerForm::class)->renderForm();
    }

    public function update(QuizManagerRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
