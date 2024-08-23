<?php

namespace Botble\QuizManager\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class AnswerRequest extends Request
{
    public function rules(): array
    {
        return [
            'question_id' => [
                'required',
                'exists:questions,id',
            ],
            'answer_1' => [
                'nullable',
                'string',
                'max:255',
            ],
            'is_answer_1' => [
                'nullable',
                'boolean',
            ],
            'answer_2' => [
                'nullable',
                'string',
                'max:255',
            ],
            'is_answer_2' => [
                'nullable',
                'boolean',
            ],
            'answer_3' => [
                'nullable',
                'string',
                'max:255',
            ],
            'is_answer_3' => [
                'nullable',
                'boolean',
            ],
            'answer_4' => [
                'nullable',
                'string',
                'max:255',
            ],
            'is_answer_4' => [
                'nullable',
                'boolean',
            ],
        ];
    }
}
