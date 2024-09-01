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
        'paper_id',
        'quiz_manager_id',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'question' => SafeContent::class,
    ];

    protected static function boot()
    {
        parent::boot();

        static::created(function ($question) {
            if ($question->paper) {
                $question->paper->increment('question_count');
                $question->paper->save();
            }
        });

        static::deleted(function ($question) {
            if ($question->paper) {
                $question->paper->decrement('question_count');
                $question->paper->save();
            }
        });
    }

    public function paper(): BelongsTo
    {
        return $this->belongsTo(Paper::class, 'paper_id');
    }

    public function quizManager(): BelongsTo
    {
        return $this->belongsTo(QuizManager::class, 'quiz_manager_id');
    }

    public function answers()
    {
        return $this->hasMany(Answer::class, 'question_id');
    }

}
