<?php

return [
    [
        'name' => 'Quiz managers',
        'flag' => 'quiz-manager.index',
    ],
    [
        'name' => 'Create',
        'flag' => 'quiz-manager.create',
        'parent_flag' => 'quiz-manager.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'quiz-manager.edit',
        'parent_flag' => 'quiz-manager.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'quiz-manager.destroy',
        'parent_flag' => 'quiz-manager.index',
    ],
];
