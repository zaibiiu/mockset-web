<?php

namespace Botble\QuizManager\Models;

use Botble\Base\Models\BaseModel;
use Botble\Member\Models\Member;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @method static \Botble\Base\Models\BaseQueryBuilder<static> query()
 */
class PaperAttempt extends BaseModel
{
    protected $table = 'paper_attempts';

    protected $fillable = [
        'member_id',
        'paper_id',
        'remaining_attempts',
    ];

    protected $casts = [
        'remaining_attempts' => 'integer',
    ];

    public function member(): BelongsTo
    {
        return $this->belongsTo(Member::class);
    }

    public function paper()
    {
        return $this->belongsTo(Paper::class);
    }
}
