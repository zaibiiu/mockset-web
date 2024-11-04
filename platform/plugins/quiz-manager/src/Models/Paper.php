<?php

namespace Botble\QuizManager\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\QuizManager\Scopes\UserScope;
use Botble\Member\Models\Member;
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
        'description',
        'quiz_manager_id',
        'chapter_id',
        'status',
        'time',
        'price',
        'marks_per_question',
        'question_count',
        'paper_status',
        'user_id',
        'paper_type',
        'allowed_attempts',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'paper_status' => PaperStatusEnum::class,
        'name' => SafeContent::class,
        'marks_per_question' => 'integer',
        'question_count' => 'integer',
    ];

    protected static function booted(): void
    {
        static::addGlobalScope(new UserScope());
    }

    public function quizManager(): BelongsTo
    {
        return $this->belongsTo(QuizManager::class, 'quiz_manager_id');
    }

    public function chapter(): BelongsTo
    {
        return $this->belongsTo(Chapter::class, 'chapter_id');
    }

    public function member(): BelongsTo
    {
        return $this->belongsTo(Member::class);
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

    public function attempts()
    {
        return $this->hasMany(PaperAttempt::class);
    }

}
