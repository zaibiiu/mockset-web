<?php
/*
* File Name: AccountBookingsController.php
* User: Zohaib Akhtar
* Project: Mockset Web
* Date Time: 23/08/2024 7:25
*/

namespace Botble\QuizManager\Http\Controllers;

use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;
use Botble\QuizManager\Repositories\Interfaces\PaperInterface;
use Botble\QuizManager\Repositories\Interfaces\QuestionInterface;
use Botble\QuizManager\Repositories\Interfaces\AnswerInterface;
use Illuminate\Routing\Controller;
use Botble\Base\Enums\BaseStatusEnum;
use Theme;
use Auth;

class PublicQuizManagerController extends Controller
{
    protected $subjectRepository;
    protected $paperRepository;
    protected $questionRepository;
    protected $answerRepository;

    public function __construct(
        QuizManagerInterface $subjectRepository,
        PaperInterface $paperRepository,
        QuestionInterface $questionRepository,
        AnswerInterface $answerRepository
    )
    {
        $this->subjectRepository = $subjectRepository;
        $this->paperRepository = $paperRepository;
        $this->questionRepository = $questionRepository;
        $this->answerRepository = $answerRepository;
    }

    public function getList($subject_id)
    {
        $subject = $this->subjectRepository->findOrFail($subject_id);
        $papers = $this->paperRepository->allBy([
            'quiz_manager_id' => $subject->id,
            'status' => BaseStatusEnum::PUBLISHED,
        ]);

        return Theme::scope('templates.papers', compact('subject', 'papers'))->render();
    }

    public function getQuestions($paper_id)
    {
        if (!auth('member')->check()) {
            return redirect()->route('public.member.login');
        } else {
            $paper = $this->paperRepository->findOrFail($paper_id);
            $questions = $this->questionRepository->allBy([
                'paper_id' => $paper->id,
                'status' => BaseStatusEnum::PUBLISHED,
            ]);

            $questionsWithAnswers = $questions->map(function ($question) {
                $answers = $this->answerRepository->allBy([
                    'question_id' => $question->id,
                ])->take(4); // Limit to 4 answers

                $question->answers = $answers;
                return $question;
            });

            return Theme::scope('templates.questions', compact('paper', 'questionsWithAnswers'))->render();
        }
    }

    public function getInstructions($paper_id)
    {
            $paper = $this->paperRepository->findOrFail($paper_id);
            $questions = $this->questionRepository->allBy([
                'paper_id' => $paper->id,
                'status' => BaseStatusEnum::PUBLISHED,
            ]);

            $questionsWithAnswers = $questions->map(function ($question) {
                $answers = $this->answerRepository->allBy([
                    'question_id' => $question->id,
                ])->take(4);

                $question->answers = $answers;
                return $question;
            });

            return Theme::scope('templates.instructions', compact('paper', 'questionsWithAnswers'))->render();
        }
}
