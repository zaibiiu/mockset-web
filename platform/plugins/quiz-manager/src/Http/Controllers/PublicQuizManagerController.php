<?php
/*
* File Name: PublicQuizManagerController.php
* User: Zohaib Akhtar
* Project: Mockset Web
* Date Time: 23/08/2024 7:25
*/

namespace Botble\QuizManager\Http\Controllers;

use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Services\Gateways\BankTransferPaymentService;
use Botble\Payment\Services\Gateways\CodPaymentService;
use Botble\Razorpay\Services\Gateways\RazorpayPaymentService;
use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;
use Botble\QuizManager\Repositories\Interfaces\PaperInterface;
use Botble\QuizManager\Repositories\Interfaces\QuestionInterface;
use Botble\QuizManager\Repositories\Interfaces\ScoreInterface;
use Botble\QuizManager\Repositories\Interfaces\AnswerInterface;
use Botble\RealEstate\Http\Resources\TransactionResource;
use Botble\RealEstate\Repositories\Interfaces\PackageInterface;
use Botble\RealEstate\Repositories\Interfaces\TransactionInterface;
use Botble\QuizManager\Repositories\Interfaces\ChapterInterface;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Botble\Base\Enums\BaseStatusEnum;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Validator;
use Theme;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\QuizManager\Enums\PaperStatusEnum;
use Botble\Payment\Repositories\Interfaces\PaymentInterface;
use Botble\QuizManager\Models\Paper;
use Botble\QuizManager\Models\Score;
use Botble\QuizManager\Models\PaperAttempt;
use Botble\SeoHelper\Facades\SeoHelper;

class PublicQuizManagerController extends Controller
{
    protected $subjectRepository;
    protected $paperRepository;
    protected $questionRepository;
    protected $answerRepository;
    protected $scoreRepository;
    protected $chapterRepository;

    public function __construct(
        QuizManagerInterface $subjectRepository,
        PaperInterface $paperRepository,
        QuestionInterface $questionRepository,
        AnswerInterface $answerRepository,
        ScoreInterface $scoreRepository,
        ChapterInterface $chapterRepository,
    )
    {
        $this->subjectRepository = $subjectRepository;
        $this->paperRepository = $paperRepository;
        $this->questionRepository = $questionRepository;
        $this->answerRepository = $answerRepository;
        $this->scoreRepository = $scoreRepository;
        $this->chapterRepository = $chapterRepository;
    }

    public function getList($subject_id)
    {
        $subject = $this->subjectRepository->findOrFail($subject_id);

        $papers = $this->paperRepository->allBy(
            [
                'quiz_manager_id' => $subject->id,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [],
            ['*'],
            ['created_at' => 'DESC']
        );

        $papers = $papers->map(function ($paper) {
            $remainingAttempts = PaperAttempt::where('paper_id', $paper->id)
                ->where('member_id', auth('member')->id())
                ->value('remaining_attempts');

            $paper->remaining_attempts = $remainingAttempts ?? 0;

            return $paper;
        });

        return Theme::scope('templates.papers', compact('subject', 'papers'))->render();
    }

    public function getQuizPapers($chapter_id)
    {
        $chapter = $this->chapterRepository->findOrFail($chapter_id);

        $papers = $this->paperRepository->allBy(
            [
                'chapter_id' => $chapter->id,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [],
            ['*'],
            ['created_at' => 'DESC']
        );

        return Theme::scope('templates.quiz-papers', compact('chapter', 'papers'))->render();
    }

    public function getChapters($subject_id)
    {
        $subject = $this->subjectRepository->findOrFail($subject_id);

        $chapters = $this->chapterRepository->allBy(
            [
                'quiz_manager_id' => $subject->id,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [],
            ['*'],
            ['created_at' => 'DESC']
        );

        return Theme::scope('templates.chapters', compact('subject', 'chapters'))->render();
    }

    public function deductAttempt(Request $request, $paperId)
    {
        $memberId = auth('member')->id();

        if (!$memberId) {
            return response()->json(['success' => false, 'message' => 'User not authenticated.']);
        }

        $attempt = PaperAttempt::where('paper_id', $paperId)
            ->where('member_id', $memberId)
            ->first();

        if (!$attempt) {
            return response()->json(['success' => false, 'message' => 'Attempt record not found.']);
        }

        if ($attempt->remaining_attempts > 0) {
            $attempt->remaining_attempts -= 1;
            $attempt->save();

            return response()->json(['success' => true]);
        }

        return response()->json(['success' => false, 'message' => 'No attempts left.']);
    }

    public function checkAttempts(Request $request, $paperId)
    {
        $memberId = auth('member')->id();

        if (!$memberId) {
            return response()->json(['success' => false, 'message' => 'User not authenticated.']);
        }

        $attempt = PaperAttempt::where('paper_id', $paperId)
            ->where('member_id', $memberId)
            ->first();

        if (!$attempt) {
            return response()->json(['success' => false, 'message' => 'No attempt record found.']);
        }

        return response()->json([
            'success' => true,
            'remaining_attempts' => $attempt->remaining_attempts,
            'paper_name' => $attempt->paper->name,
            'question_count' => $attempt->paper->question_count,
            'time' => $attempt->paper->time,
            'paper_id' => $attempt->paper_id,
        ]);
    }


    public function getQuestions($paper_id)
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

            return Theme::scope('templates.questions', compact('paper', 'questionsWithAnswers'))->render();
    }

    public function makePaperPayment(Request $request, $paper_id)
    {
        $paper = $this->paperRepository->findOrFail($paper_id);
        $amount = $paper->price;
        $name = $paper->name;

        return Theme::scope('templates.payments.payment-methods', compact(
            'paper',
            'amount',
            'name',
        ))->render();
    }

    public function showPaymentCompleted(Request $request)
    {
        $paymentCompleted = [
            'chargeId' => $request->get('chargeId'),
            'amount' => $request->get('amount'),
            'createdAt' => $request->get('createdAt'),
            'paper' => $this->paperRepository->getById($request->get('paperId')),
        ];
        return Theme::scope('templates.payments.payment-completed', compact(
            'paymentCompleted',

        ))->render();
    }

    public function getInstructions(Request $request, $paper_id)
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

        $wrongAnswers = json_decode($request->query('wrongAnswers'), true);

        return Theme::scope('templates.instructions', compact('paper', 'questionsWithAnswers', 'wrongAnswers'))->render();
    }

    public function getQuizList(Request $request, $paper_id)
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

        return Theme::scope('templates.quiz', compact('paper', 'questionsWithAnswers'))->render();
    }

    public function submitScore(
        Request $request,
        $paper_id,
        BaseHttpResponse $response
    ) {
        if (!auth('member')->check()) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $member = auth('member')->user();

        $validatedData = $request->validate([
            'score' => 'required|numeric|min:0',
            'wrongAnswers' => 'array',
            'wrongAnswers.*.questionIndex' => 'required|integer',
            'wrongAnswers.*.selectedAnswer' => 'required|string',
        ]);

        $paper = $this->paperRepository->findOrFail($paper_id);

        $totalMarks = $paper->question_count * $paper->marks_per_question;

        $userScore = $validatedData['score'];
        $percentage = ($totalMarks > 0) ? ($userScore / $totalMarks) * 100 : 0;

        $status = ($percentage >= 70) ? 1 : 0;

        $score = Score::where('paper_id', $paper_id)
            ->where('member_id', $member->id)
            ->first();

        if ($score) {
            $score->user_score = $userScore;
            $score->status = $status;
            $score->wrong_answers = json_encode($validatedData['wrongAnswers']);
            $score->save();
        } else {
            Score::create([
                'paper_id' => $paper_id,
                'member_id' => $member->id,
                'user_score' => $userScore,
                'status' => $status,
                'wrong_answers' => json_encode($validatedData['wrongAnswers']),
            ]);
        }

        return $response->setMessage('Your test has been taken successfully');
    }

    public function viewUserPapers(Request $request)
    {
        $userId = auth('member')->id();

        if (!$userId) {
            return redirect()->route('public.member.login')->with('error', 'You need to log in to view your papers.');
        }

        $completedPapers = Score::with(['paper', 'paper.quizManager'])
            ->where('member_id', $userId)
            ->get()
            ->groupBy('paper.quiz_manager_id');

        return Theme::scope('templates.history.old-papers', compact('completedPapers'))->render();
    }

    protected function storePaperAttempt(int $memberId, Paper $paper)
    {
        $existingAttempt = PaperAttempt::where('member_id', $memberId)
            ->where('paper_id', $paper->id)
            ->first();

        if ($existingAttempt) {
            $existingAttempt->remaining_attempts += $paper->allowed_attempts;
            $existingAttempt->save();
        } else {
            PaperAttempt::create([
                'member_id' => $memberId,
                'paper_id' => $paper->id,
                'remaining_attempts' => $paper->allowed_attempts,
            ]);
        }
    }

    public function makePayment(
        Request $request,
        BaseHttpResponse $response,
        string $paperId
    ) {

        $paper = $this->paperRepository->getById($paperId);
        if (!$paper) {
            return redirect()->to(route('subject_list'));
        }

        $amount = $paper->price;
        $currency = strtoupper($request->input('currency', config('plugins.payment.payment.currency')));

        $callbackUrl = route('public.paper.payment', $paperId);
        $returnUrl = route('public.paper.cancel', $paperId);

        $data = [
            'error' => false,
            'message' => false,
            'amount' => $amount,
            'currency' => $currency,
            'type' => $request->input('payment_method'),
            'charge_id' => null,
            'paper' => $paper,
            'return_url' => $returnUrl,
            'callback_url' => $callbackUrl,
        ];

        session()->put('selected_payment_method', $data['type']);

        $paymentData = apply_filters(PAYMENT_FILTER_PAPER_PAYMENT_DATA, $data, $request);

        switch ($request->input('payment_method')) {
            case PaymentMethodEnum::COD:
                $codPaymentService = app(CodPaymentService::class);
                $data['charge_id'] = $codPaymentService->execute($paymentData);
                $data['message'] = trans('plugins/payment::payment.payment_pending');
                $data['checkoutUrl'] = $callbackUrl . '?charge_id=' . $data['charge_id'];
                break;

            case PaymentMethodEnum::BANK_TRANSFER:
                $bankTransferPaymentService = app(BankTransferPaymentService::class);
                $data['charge_id'] = $bankTransferPaymentService->execute($paymentData);
                $data['message'] = trans('plugins/payment::payment.payment_pending');
                $data['checkoutUrl'] = $callbackUrl . '?charge_id=' . $data['charge_id'];
                break;

            default:
                $data = apply_filters(PAYMENT_FILTER_AFTER_POST_CHECKOUT, $data, $request);
                break;
        }

        if ($checkoutUrl = Arr::get($data, 'checkoutUrl')) {
            return $response
                ->setError($data['error'])
                ->setNextUrl($checkoutUrl)
                ->withInput()
                ->setMessage($data['message']);
        }

        if ($data['error'] || !$data['charge_id']) {
            return $response
                ->setError()
                ->setNextUrl($returnUrl)
                ->withInput()
                ->setMessage($data['message'] ?: __('Checkout error!'));
        }

        return redirect()->to($callbackUrl . '?' . http_build_query($data))
            ->with('success_msg', trans('plugins/payment::payment.checkout_success'));
    }

    public function paymentCallback(
        $paperId,
        Request $request,
        TransactionInterface $transactionRepository,
        BaseHttpResponse $response
    ) {

        $paper = $this->paperRepository->getById($paperId);
        if (!$paper) {
            return $response
                ->setError()
                ->setNextUrl(route('subject_list'))
                ->setMessage(__('Paper not found!'));
        }

        $paymentMethod = $request->input('type');
        if ($paymentMethod === RAZORPAY_PAYMENT_METHOD_NAME) {

            $razorpayService = app(RazorpayPaymentService::class);

            $chargeId = $request->input('charge_id');

            $inputData = $request->input();
            $inputData['order_id'] = $paper->id;
            $requestData = new Request($inputData); // Wrap inputData in a Request object

            $razorpayService->afterMakePayment($requestData);

            $this->savePayment($paper, $chargeId, $transactionRepository);

            return redirect()->route('payment_completed', [
                'chargeId' => $chargeId,
                'amount' => $paper->price,
                'createdAt' => now(),
                'paperId' => $paper->id,
            ]);
        }

        return $response
            ->setError()
            ->setNextUrl(route('subject_list'))
            ->setMessage(__('Payment failed!'));
    }


    protected function savePayment(Paper $paper,  ?string $chargeId, TransactionInterface $transactionRepository, bool $force = false)
    {
        $payment = app(PaymentInterface::class)->getFirstBy(['charge_id' => $chargeId]);

        if (!$payment && !$force) {
            return false;
        }

        $member = auth('member')->user();

        $transactionRepository->createOrUpdate([
            'user_id' => 0,
            'member_id' => $member->id,
            'payment_id' => $payment ? $payment->id : null,
        ]);

        if (($payment && $payment->status == PaymentStatusEnum::COMPLETED) || $force) {
            $paper->save();
        }

        $this->storePaperAttempt($member->id, $paper);

        return true;
    }

    public function paymentCancel(int|string $paperId, Request $request, BaseHttpResponse $response)
    {
        $paper = $this->paperRepository->getById($paperId);
        if (!$paper) {
            return $response
                ->setError()
                ->setNextUrl(route('subject_list'))
                ->setMessage(__('Paper not found!'));
        }

        return $response
            ->setError()
            ->setNextUrl(route('subject_list'))
            ->setMessage(__('Payment was canceled. You can retry the payment or return to the main page.'));
    }


}
