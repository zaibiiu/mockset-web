<?php

namespace Botble\QuizManager\Http\Resources;

use Botble\QuizManager\Models\Question;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Question
 */
class QuestionResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->question,
        ];
    }
}
