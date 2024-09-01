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
use Botble\PayPal\Services\Gateways\PayPalPaymentService;
use Botble\QuizManager\Repositories\Interfaces\QuizManagerInterface;
use Botble\QuizManager\Repositories\Interfaces\PaperInterface;
use Botble\QuizManager\Repositories\Interfaces\QuestionInterface;
use Botble\QuizManager\Repositories\Interfaces\ScoreInterface;
use Botble\QuizManager\Repositories\Interfaces\AnswerInterface;
use Botble\RealEstate\Repositories\Interfaces\TransactionInterface;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Botble\Base\Enums\BaseStatusEnum;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Validator;
use Theme;
use Auth;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Repositories\Interfaces\PaymentInterface;
use Botble\QuizManager\Models\Paper;
use Botble\QuizManager\Models\Score;
use Botble\QuizManager\Enums\UserPaperStatusEnum;

class PublicQuizManagerController extends Controller
{
    protected $subjectRepository;
    protected $paperRepository;
    protected $questionRepository;
    protected $answerRepository;
    protected $scoreRepository;

    public function __construct(
        QuizManagerInterface $subjectRepository,
        PaperInterface $paperRepository,
        QuestionInterface $questionRepository,
        AnswerInterface $answerRepository,
        ScoreInterface $scoreRepository,
    )
    {
        $this->subjectRepository = $subjectRepository;
        $this->paperRepository = $paperRepository;
        $this->questionRepository = $questionRepository;
        $this->answerRepository = $answerRepository;
        $this->scoreRepository = $scoreRepository;
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
            'wrongAnswers' => 'required|array',
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

        $completedPapers = Score::with('paper')
            ->where('member_id', $userId)
            ->get();

        return Theme::scope('templates.history.old-papers', compact('completedPapers'))->render();
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
            'callback_url' => $callbackUrl
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

        // Check for PayPal payment method
        if (is_plugin_active('paypal') && $request->input('type') == PAYPAL_PAYMENT_METHOD_NAME) {
            $validator = Validator::make($request->input(), [
                'amount' => 'required|numeric',
                'currency' => 'required',
            ]);

            if ($validator->fails()) {
                return $response
                    ->setError()
                    ->setMessage($validator->getMessageBag()->first());
            }

            $payPalService = app(PayPalPaymentService::class);
            $paymentStatus = $payPalService->getPaymentStatus($request);

            if ($paymentStatus) {
                $chargeId = session('paypal_payment_id');
                $inputData = $request->input();
                $inputData['order_id'] = $paper->id;
                $payPalService->afterMakePayment($inputData);

                $this->savePayment($paper, $chargeId, $transactionRepository);

                return $response
                    ->setMessage('Your paper payment was successful.')
                    ->setData(['next_page' => route('paper_list', ['paper_id' => $paper->id])]);
            }

            return $response
                ->setError()
                ->setNextUrl(route('subject_list'))
                ->setMessage($payPalService->getErrorMessage());
        }

        // Handle other payment methods
        $this->savePayment($paper, $request->input('charge_id'), $transactionRepository);

        if (!$request->has('success') || $request->input('success')) {
            return $response
                ->setMessage('Your paper payment was successful.')
                ->setData(['next_page' => route('paper_list', ['paper_id' => $paper->id])]);
        }

        return $response
            ->setError()
            ->setNextUrl(route('subject_list'))
            ->setMessage(__('Payment failed!'));
    }

    protected function savePayment(Paper $paper, ?string $chargeId, TransactionInterface $transactionRepository, bool $force = false)
    {
        $payment = app(PaymentInterface::class)->getFirstBy(['charge_id' => $chargeId]);

        if (!$payment && !$force) {
            return false;
        }

        $account = auth('account')->user();

        if (($payment && $payment->status == PaymentStatusEnum::COMPLETED) || $force) {

            $paper->save();
        }

        return true;
    }


    public function paymentCancel(Request $request)
    {
        dd($request);
    }


}
