<?php

namespace Botble\QuizManager\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;
use Botble\QuizManager\Models\Paper;

interface PaperInterface extends RepositoryInterface
{
    public function getById(int $id, array $with = [], array $extra = []): ?Paper;
}
