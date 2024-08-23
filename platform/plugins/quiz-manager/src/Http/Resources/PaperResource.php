<?php

namespace Botble\QuizManager\Http\Resources;

use Botble\QuizManager\Models\Paper;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Paper
 */
class PaperResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
        ];
    }
}
