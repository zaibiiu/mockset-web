<?php

namespace Botble\QuizManager\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @method static \Botble\Base\Models\BaseQueryBuilder<static> query()
 */
class Question extends BaseModel
{
    protected $table = 'questions';

    protected $fillable = [
        'question',
        'page_number',
        'time',
        'paper_id',
        'quiz_manager_id',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'question' => SafeContent::class,
    ];

    public function paper(): BelongsTo
    {
        return $this->belongsTo(Paper::class, 'paper_id');
    }

    public function quizManager(): BelongsTo
    {
        return $this->belongsTo(QuizManager::class, 'quiz_manager_id');
    }
}
