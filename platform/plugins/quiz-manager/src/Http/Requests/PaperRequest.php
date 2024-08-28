<?php

namespace Botble\QuizManager\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;
use Botble\QuizManager\Enums\PaperStatusEnum;

class PaperRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:220'],
            'quiz_manager_id' => ['required', 'integer', 'exists:quiz_managers,id'],
            'status' => Rule::in(BaseStatusEnum::values()),
            'paper_status' => Rule::in(PaperStatusEnum::values()),
            'time' => [
                'required',
                'integer',
                'min:0',
            ],
            'total_attempts' => [
                'required',
                'integer',
                'min:0',
            ],
            'marks_per_question' => [
                'required',
                'integer',
                'min:0',
            ],
        ];
    }
}
