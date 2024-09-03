<?php

namespace Botble\QuizManager\Models;

use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Botble\Member\Models\Member;

/**
 * @method static \Botble\Base\Models\BaseQueryBuilder<static> query()
 */
class Score extends BaseModel
{
    protected $table = 'paper_scores';

    protected $fillable = [
        'member_id',
        'paper_id',
        'quiz_manager_id',
        'user_id',
        'user_score',
        'status',
        'wrong_answers'
    ];

    protected $casts = [
        'user_score' => 'integer',
        'status' => 'integer',
        'wrong_answers' => 'json'
    ];

    public function paper(): BelongsTo
    {
        return $this->belongsTo(Paper::class, 'paper_id');
    }

    public function quizManager(): BelongsTo
    {
        return $this->belongsTo(QuizManager::class, 'quiz_manager_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(Member::class, 'member_id');
    }
}

