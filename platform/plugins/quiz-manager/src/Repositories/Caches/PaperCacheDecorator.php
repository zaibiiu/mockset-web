<?php

namespace Botble\QuizManager\Repositories\Caches;

use Botble\QuizManager\Repositories\Interfaces\PaperInterface;
use Botble\QuizManager\Models\Paper;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

/**
 * @deprecated
 */
class PaperCacheDecorator extends CacheAbstractDecorator implements PaperInterface
{
    public function getById(int $id, array $with = [], array $extra = []): ?Paper
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

}
