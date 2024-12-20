<?php

namespace Botble\QuizManager\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class QuestionRequest extends Request
{
    public function rules(): array
    {
        return [
            'quiz_manager_id' => [
                'required',
                'exists:quiz_managers,id',
            ],
            'paper_id' => [
                'nullable',
                'exists:papers,id',
            ],
            'question' => [
                'required',
                'string',
            ],
            'status' => [
                'required',
                Rule::in(BaseStatusEnum::values()),
            ],
        ];
    }
}
