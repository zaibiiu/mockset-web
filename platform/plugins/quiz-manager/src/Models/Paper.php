<?php

namespace Botble\QuizManager\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Botble\QuizManager\Enums\PaperStatusEnum;
use Botble\ACL\Models\User;

/**
 * @method static \Botble\Base\Models\BaseQueryBuilder<static> query()
 */
class Paper extends BaseModel
{
    protected $table = 'papers';

    protected $fillable = [
        'name',
        'quiz_manager_id',
        'status',
        'time',
        'price',
        'total_attempts',
        'marks_per_question',
        'question_count',
        'paper_status',
        'user_id',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'paper_status' => PaperStatusEnum::class,
        'name' => SafeContent::class,
        'marks_per_question' => 'integer',
        'question_count' => 'integer',
    ];

    public function quizManager(): BelongsTo
    {
        return $this->belongsTo(QuizManager::class, 'quiz_manager_id');
    }

    public function questions()
    {
        return $this->hasMany(Question::class);
    }

    public function getQuestionsCountAttribute()
    {
        return $this->questions()->count();
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function score()
    {
        return $this->hasMany(Score::class);
    }
}

