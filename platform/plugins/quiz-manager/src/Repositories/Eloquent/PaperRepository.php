<?php

namespace Botble\QuizManager\Repositories\Eloquent;

use Botble\QuizManager\Repositories\Interfaces\PaperInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Botble\QuizManager\Models\Paper;

class PaperRepository extends RepositoriesAbstract implements PaperInterface
{
    public function getById(int $id, array $with = [], array $extra = []): ?Paper
    {
        $params = array_merge([
            'condition' => [
                'id' => $id,
            ],
            'with' => $with,
            'take' => 1,
        ], $extra);

        // Optionally, apply any additional query constraints or filters
        // @phpstan-ignore-next-line
        //$this->model = $this->originalModel->someFilter();

        return $this->advancedGet($params);
    }

}
