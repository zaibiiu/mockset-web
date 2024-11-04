<?php

namespace Botble\QuizManager\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;
use Botble\QuizManager\Enums\PaperStatusEnum;
use Botble\QuizManager\Enums\PaperTypeEnum;

class PaperRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:220'],
            'quiz_manager_id' => ['required', 'integer', 'exists:quiz_managers,id'],
            'status' => Rule::in(BaseStatusEnum::values()),
            'chapter_id' => [
                'nullable',
                'integer',
                'required_if:paper_type,' . PaperTypeEnum::QUIZ,
            ],
            'paper_status' => [
                'nullable',
                Rule::in(PaperStatusEnum::values()),
                'required_if:paper_type,' . PaperTypeEnum::MOCKTEST,
            ],
            'paper_type' => Rule::in(PaperTypeEnum::values()),
            'price' => [
                'required_if:paper_status,' . PaperStatusEnum::BUY,
            ],
            'allowed_attempts' => [
                'required_if:paper_status,' . PaperStatusEnum::BUY,
            ],
            'description' => [
                'required_if:paper_type,' . PaperTypeEnum::QUIZ,
            ],
            'time' => [
                'nullable',
                'integer',
                'min:0',
                'required_if:paper_type,' . PaperTypeEnum::MOCKTEST,
            ],
            'marks_per_question' => [
                'required',
                'integer',
                'min:0',
            ],
        ];
    }
}
