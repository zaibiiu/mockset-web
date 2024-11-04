<?php

namespace Botble\QuizManager\Providers;

use Botble\Base\Supports\Helper;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;
use Botble\QuizManager\Repositories\Eloquent\QuizManagerRepository;
use Botble\QuizManager\Models\QuizManager;
use Botble\QuizManager\Repositories\Interfaces\PaperInterface;
use Botble\QuizManager\Repositories\Eloquent\PaperRepository;
use Botble\QuizManager\Models\Paper;
use Botble\QuizManager\Models\Score;
use Botble\QuizManager\Models\Answer;
use Botble\QuizManager\Models\Chapter;
use Botble\QuizManager\Repositories\Interfaces\QuestionInterface;
use Botble\QuizManager\Repositories\Interfaces\AnswerInterface;
use Botble\QuizManager\Repositories\Interfaces\ScoreInterface;
use Botble\QuizManager\Repositories\Interfaces\ChapterInterface;
use Botble\QuizManager\Repositories\Eloquent\QuestionRepository;
use Botble\QuizManager\Repositories\Eloquent\AnswerRepository;
use Botble\QuizManager\Repositories\Eloquent\ScoreRepository;
use Botble\QuizManager\Repositories\Eloquent\ChapterRepository;
use Botble\QuizManager\Models\Question;

class QuizManagerServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        Helper::autoload(__DIR__ . '/../../helpers');

        $this->app->bind(QuizManagerInterface::class, function () {
            return new QuizManagerRepository(new QuizManager());
        });

        $this->app->bind(ChapterInterface::class, function () {
            return new ChapterRepository(new Chapter());
        });

        $this->app->bind(PaperInterface::class, function () {
            return new PaperRepository(new Paper());
        });

        $this->app->bind(QuestionInterface::class, function () {
            return new QuestionRepository(new Question());
        });

        $this->app->bind(AnswerInterface::class, function () {
            return new AnswerRepository(new Answer());
        });

        $this->app->bind(ScoreInterface::class, function () {
            return new ScoreRepository(new Score());
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
                    'id' => 'cms-plugins-chapter',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-quiz-manager',
                    'name' => 'Chapters',
                    'icon' => 'fas fa-book-open',
                    'url' => route('chapter.index'),
                    'permissions' => ['chapter.index'],
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
                    'name' => 'Questions',
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
                ])
                ->registerItem([
                    'id' => 'cms-plugins-scores',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-quiz-manager',
                    'name' => 'User Scores',
                    'icon' => 'fas fa-chart-line',
                    'url' => route('score.index'),
                    'permissions' => ['score.index'],
                ]);
            });

        $this->app->register(HookServiceProvider::class);
    }
}
