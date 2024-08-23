<?php

namespace Botble\QuizManager\Providers;

use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;
use Botble\QuizManager\Repositories\Eloquent\QuizManagerRepository;
use Botble\QuizManager\Models\QuizManager;
use Botble\QuizManager\Repositories\Interfaces\PaperInterface;
use Botble\QuizManager\Repositories\Eloquent\PaperRepository;
use Botble\QuizManager\Models\Paper;
use Botble\QuizManager\Repositories\Interfaces\QuestionInterface;
use Botble\QuizManager\Repositories\Eloquent\QuestionRepository;
use Botble\QuizManager\Models\Question;

class QuizManagerServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(QuizManagerInterface::class, function () {
            return new QuizManagerRepository(new QuizManager());
        });

        $this->app->bind(PaperInterface::class, function () {
            return new PaperRepository(new Paper());
        });

        $this->app->bind(QuestionInterface::class, function () {
            return new QuestionRepository(new Question());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/quiz-manager')
            ->loadHelpers()
            ->loadAndPublishConfigurations(["permissions"])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadMigrations()
            ->publishAssets();

            if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
                \Botble\LanguageAdvanced\Supports\LanguageAdvancedManager::registerModule(QuizManager::class, [
                    'name',
                ]);
            }

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
            ->registerItem([
                    'id' => 'cms-plugins-quiz-manager',
                    'priority' => 5,
                    'parent_id' => null,
                    'name' => 'Quiz Manager',
                    'icon' => 'fas fa-question-circle',
                ])
                ->registerItem([
                    'id' => 'cms-plugins-subject',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-quiz-manager',
                    'name' => 'Subject',
                    'icon' => 'fas fa-book',
                    'url' => route('quiz-manager.index'),
                    'permissions' => ['quiz-manager.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-paper',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-quiz-manager',
                    'name' => 'Papers',
                    'icon' => 'fas fa-file',
                    'url' => route('paper.index'),
                    'permissions' => ['paper.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-question',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-quiz-manager',
                    'name' => 'Pages and Questions',
                    'icon' => 'fa fa-book-open',
                    'url' => route('question.index'),
                    'permissions' => ['question.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-answer',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-quiz-manager',
                    'name' => 'Answers',
                    'icon' => 'fas fa-check',
                    'url' => route('answer.index'),
                    'permissions' => ['answer.index'],
                ]);
            });
    }
}
