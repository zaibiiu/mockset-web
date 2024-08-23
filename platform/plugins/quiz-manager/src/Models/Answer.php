<?php

namespace Botble\QuizManager\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @method static \Botble\Base\Models\BaseQueryBuilder<static> query()
 */
class Answer extends BaseModel
{
    protected $table = 'answers';

    protected $fillable = [
        'question_id',
        'description',
        'answer_1',
        'is_answer_1',
        'answer_2',
        'is_answer_2',
        'answer_3',
        'is_answer_3',
        'answer_4',
        'is_answer_4',
    ];

    protected $casts = [
        'is_answer_1' => 'boolean',
        'is_answer_2' => 'boolean',
        'is_answer_3' => 'boolean',
        'is_answer_4' => 'boolean',
    ];

    public function question(): BelongsTo
    {
        return $this->belongsTo(Paper::class, 'question_id');
    }

}
