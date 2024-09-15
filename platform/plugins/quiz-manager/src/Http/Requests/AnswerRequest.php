<?php

namespace Botble\QuizManager\Http\Requests;

use Botble\Support\Http\Requests\Request;

class AnswerRequest extends Request
{
    public function rules(): array
    {
        return [
            'question_id' => [
                'required',
                'exists:questions,id',
            ],
            'description' => 'required',
            'paper_id' => 'required|exists:papers,id',
            'answer_1' => [
                'required',
                'string',
                'max:255',
            ],
            'is_answer_1' => [
                'nullable',
                'boolean',
            ],
            'answer_2' => [
                'required',
                'string',
                'max:255',
            ],
            'is_answer_2' => [
                'nullable',
                'boolean',
            ],
            'answer_3' => [
                'required',
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

    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            $correctAnswers = array_filter([
                $this->input('is_answer_1'),
                $this->input('is_answer_2'),
                $this->input('is_answer_3'),
                $this->input('is_answer_4'),
            ]);

            if (count($correctAnswers) > 1) {
                $validator->errors()->add('is_answer', 'Only one correct answer can be selected.');
            }
        });
    }
}
