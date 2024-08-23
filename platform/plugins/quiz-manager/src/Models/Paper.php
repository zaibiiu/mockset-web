<?php

namespace Botble\QuizManager\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
    ];

    public function quizManager(): BelongsTo
    {
        return $this->belongsTo(QuizManager::class, 'quiz_manager_id');
    }
}
