<?php

namespace Botble\QuizManager\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class PaperRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:220'],
            'quiz_manager_id' => ['required', 'integer', 'exists:quiz_managers,id'],
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
