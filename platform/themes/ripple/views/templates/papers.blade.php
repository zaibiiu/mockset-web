<div class="header-container">
    <h1 class="section-title">{{ $subject->name }} Paperworks</h1>
</div>

@if(auth('member')->check())
    @php
        $hasCompletedPapers = \Botble\QuizManager\Models\Score::where('member_id', auth('member')->id())->exists();
    @endphp

    @if($hasCompletedPapers)
        <a href="{{ route('user_papers') }}"
           class="checkout-badge rounded mt-2">
            <strong>Explore Your Previous Test Attempts</strong>
        </a>
    @endif
@else
    <a href="{{ route('public.member.login') }}"
       class="checkout-badge rounded mt-2" style="background-color: #f8d7da; color: #721c24;">
        Already have an account? <strong>Click here to login</strong>
    </a>
@endif

<div class="row">
    <!-- Paperwork Cards Column -->

    <div class="col-lg-9 col-12 col-md-12 paper-type-buttons">
        <button class="btn btn-primary" id="show-quiz-btn">Quiz Papers</button>
        <button class="btn btn-secondary" id="show-mocktest-btn">Mock Test Papers</button>
    </div>


    <div class="col-lg-9 col-12" id="quiz-papers" class="paper-section" style="display: block;">
        <p class="status-message">You are currently in the Quiz Papers section, tailored for your study needs.</p>
    @foreach ($papers as $paper)
            @if ($paper->paper_type == \Botble\QuizManager\Enums\PaperTypeEnum::QUIZ)
            <div class="col-12 mb-4">
                <div class="paper-card">
                    <div class="paper-card-icon">
                        <i class="fas fa-question-circle paper-icon"></i>
                    </div>
                    <div class="paper-card-content">
                        <h3 class="paper-title">{{ $paper->name }}</h3>
                        <p style="font-size: 16px; color: grey; font-weight: 500;">{{ $paper->description }}</p>
                        <div class="paper-details">
                            <div class="paper-detail-item">
                                <i class="fas fa-question-circle"></i> {{ $paper->question_count }} questions
                            </div>
                            <div class="paper-detail-item">
                                <i class="fas fa-award"></i> {{ $paper->question_count * $paper->marks_per_question }} marks
                            </div>
                        </div>
                    </div>
                        <a class="start-test-btn"
                              href = "{{route('quiz_list', ['paper_id' => $paper->id]) }}">
                            Start Test
                        </a>
                </div>
            </div>
            @endif
        @endforeach
    </div>

    <div class="col-lg-9 col-12" id="mocktest-papers" style="display: none">
        <p class="status-message">You are currently in the Mock Test Papers section, tailored for your study needs.</p>
    @foreach ($papers as $paper)
            @if ($paper->paper_type == \Botble\QuizManager\Enums\PaperTypeEnum::MOCKTEST)
            <div class="col-12 mb-4">
                <div class="paper-card {{ ($paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::BUY && !auth('member')->check()) ? 'disabled-card' : '' }}">
                    <div class="paper-status-badge {{ $paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::FREE ? 'badge-free' : 'badge-paid' }}">
                        {{ ucfirst($paper->paper_status) }}
                    </div>
                    <div class="paper-card-icon">
                        <i class="fas fa-file-alt paper-icon"></i>
                    </div>
                    <div class="paper-card-content">
                        <h3 class="paper-title">{{ $paper->name }}</h3>
                        <p style="font-size: 16px; color: grey; font-weight: 500;">{{ $paper->description }}</p>
                        <div class="paper-details">
                            <div class="paper-detail-item">
                                <i class="fas fa-question-circle"></i> {{ $paper->question_count }} questions
                            </div>
                            <div class="paper-detail-item">
                                <i class="fas fa-clock"></i> {{ $paper->time }} mins
                            </div>
                            <div class="paper-detail-item">
                                <i class="fas fa-award"></i> {{ $paper->question_count * $paper->marks_per_question }} marks
                            </div>
                        </div>
                    </div>
                    @if($paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::BUY)
                        <div class="paper-total-attempt">
                            <i class="fas fa-dollar-sign"></i> Price: {{ number_format($paper->price, 2) }}
                        </div>
                        <button class="start-test-btn"
                                onclick="showInstructionModal('{{ $paper->name }}', {{ $paper->question_count }}, {{ $paper->time }}, '', '{{ route('public.paper.make-payment', $paper->id) }}', '{{ route('public.paper.payment', $paper->id) }}', '{{ route('public.paper.cancel', $paper->id) }}')"
                                {{ auth('member')->check() ? '' : 'disabled' }}>
                            Pay Now & Start Test
                        </button>
                        @if(!auth('member')->check())
                            <p class="access-message">You can attempt this paper after logging in.</p>
                        @endif
                    @else
                        <button class="start-test-btn"
                                onclick="showInstructionModal('{{ $paper->name }}', {{ $paper->question_count }}, {{ $paper->time }}, '{{ route('paper_list', ['paper_id' => $paper->id]) }}')">
                            Start Test
                        </button>
                    @endif
                </div>
            </div>
            @endif
        @endforeach
    </div>

    <!-- Instructions Section -->
    <div class="col-lg-3 col-12">
        <div class="instructions-container">
            <div class="instructions-header">
                <i class="bulb-icon fas fa-bullhorn"></i>
                <h2 class="instructions-title">Important Instructions</h2>
            </div>
            <div class="instructions-body">
                <p>Before starting any paper, please carefully read the following instructions:</p>
                <ul class="instructions-list">
                    <li>All papers consist of multiple-choice questions.</li>
                    <li>Each paper has a time limit, so manage your time effectively.</li>
                    <li>Paid papers require payment before access. Ensure the payment is processed to start.</li>
                    <li>Submit all answers before the timer expires to receive full credit.</li>
                    <li>Once submitted, answers cannot be changed.</li>
                </ul>
            </div>
        </div>
    </div>

</div>

    <div id="instructionModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeInstructionModal()">&times;</span>
            <h2 id="instructionTitle">Instructions</h2>
            <p id="instructionText">
            </p>
            @if ($paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::BUY)
            <div id="paymentSection" style="margin-bottom: 20px;">
                <h4 class="mb-3">Select Payment Method</h4>
                <span class="spacer"></span>
                <div class="col-xs-12 mt-4 mb-4">
                    <form id="paymentForm" action="" method="post">
                        @csrf
                        <link rel="stylesheet" href="{{ asset('vendor/core/plugins/payment/css/payment.css') }}?v=1.1.0">
                        @include('plugins/payment::partials.payment-methods-for-payment', [
                            'action'       => '',
                            'currency'     => cms_currency()->getDefaultCurrency()->title,
                            'amount'       => '',
                            'name'         => '',
                            'returnUrl'    => '',
                            'callbackUrl'  => '',
                        ])
                        <button type="submit" class="start-test-btn">
                            Pay Now & Start Test
                        </button>
                    </form>
                </div>
            </div>
            @endif
            <button id="startTestBtn" class="start-test-btn" style="display: none;" onclick="startTest()">Start Test</button>
        </div>
    </div>


<script>
    function showInstructionModal(paperName, questionCount, totalTime, testUrl = '', paymentUrl = '', returnUrl = '', callbackUrl = '') {

        var modal = document.getElementById('instructionModal');
        var instructionTitle = document.getElementById('instructionTitle');
        var instructionText = document.getElementById('instructionText');
        var paymentSection = document.getElementById('paymentSection');
        var paymentForm = document.getElementById('paymentForm');
        var startTestBtn = document.getElementById('startTestBtn');
        var closeBtn = document.querySelector('.close-btn');

        if (!modal || !instructionTitle || !instructionText || !paymentSection || !paymentForm || !startTestBtn || !closeBtn) {
            return;
        }

        instructionTitle.textContent = 'Instructions for ' + paperName;
        if (questionCount > 0) {
                instructionText.innerHTML = `The Question Paper will include ${questionCount} questions, and for each question, you will have 15 seconds.`;
        } else {
            instructionText.textContent = 'N/A (No questions available)';
        }

        if (paymentUrl) {
            paymentSection.style.display = 'block';
            paymentForm.action = paymentUrl;

            var amountInput = paymentForm.querySelector('input[name="amount"]');
            var nameInput = paymentForm.querySelector('input[name="name"]');
            var returnUrlInput = paymentForm.querySelector('input[name="returnUrl"]');
            var callbackUrlInput = paymentForm.querySelector('input[name="callbackUrl"]');

            if (amountInput) amountInput.value = '{{ $paper->price }}';
            if (nameInput) nameInput.value = paperName;
            if (returnUrlInput) returnUrlInput.value = returnUrl;
            if (callbackUrlInput) callbackUrlInput.value = callbackUrl;

            startTestBtn.style.display = 'none';
        } else {
            paymentSection.style.display = 'none';
            startTestBtn.style.display = 'block';
            startTestBtn.setAttribute('data-test-url', testUrl);
        }

        modal.style.display = 'block';
    }

    function closeInstructionModal() {
        var modal = document.getElementById('instructionModal');
        if (modal) {
            modal.style.display = 'none';
        }
    }

    function startTest() {
        var testUrl = document.querySelector('#startTestBtn').getAttribute('data-test-url');
        closeInstructionModal();
        if (testUrl) {
            localStorage.removeItem('currentIndex');
            localStorage.removeItem('paperTimer');
            localStorage.removeItem('questionTimers');
            localStorage.removeItem('questionCompleted');
            localStorage.removeItem('answers');
            sessionStorage.removeItem('paperCompleted');

            window.location.href = testUrl;
        }
    }

    document.querySelector('.close-btn').addEventListener('click', function() {
        closeInstructionModal();
    });

    window.onclick = function(event) {
        var modal = document.getElementById('instructionModal');
        if (event.target === modal) {
            closeInstructionModal();
        }
    };

    let isTransitioning = false;

    function togglePaperStatus() {
        if (isTransitioning) return;
        isTransitioning = true;

        const toggle = document.getElementById("paper-toggle");
        const isFree = toggle.checked;
        hideAllPapers(() => {
            filterPapers(isFree);
        });
    }
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const showQuizBtn = document.getElementById('show-quiz-btn');
        const showMocktestBtn = document.getElementById('show-mocktest-btn');
        const quizPapersSection = document.getElementById('quiz-papers');
        const mocktestPapersSection = document.getElementById('mocktest-papers');

        quizPapersSection.classList.add('active');
        showQuizBtn.classList.add('btn-primary');
        showMocktestBtn.classList.add('btn-secondary');

        function fadeOut(element, callback) {
            element.style.opacity = 0;
            setTimeout(function() {
                element.style.display = 'none';
                if (callback) callback();
            }, 500);
        }

        function fadeIn(element) {
            element.style.display = 'block';
            setTimeout(function() {
                element.style.opacity = 1;
            }, 50);
        }

        showQuizBtn.addEventListener('click', function() {
            if (!quizPapersSection.classList.contains('active')) {
                fadeOut(mocktestPapersSection, function() {
                    fadeIn(quizPapersSection);
                    quizPapersSection.classList.add('active');
                    mocktestPapersSection.classList.remove('active');
                    showQuizBtn.classList.replace('btn-secondary', 'btn-primary');
                    showMocktestBtn.classList.replace('btn-primary', 'btn-secondary');
                });
            }
        });

        showMocktestBtn.addEventListener('click', function() {
            if (!mocktestPapersSection.classList.contains('active')) {
                fadeOut(quizPapersSection, function() {
                    fadeIn(mocktestPapersSection);
                    mocktestPapersSection.classList.add('active');
                    quizPapersSection.classList.remove('active');
                    showMocktestBtn.classList.replace('btn-secondary', 'btn-primary');
                    showQuizBtn.classList.replace('btn-primary', 'btn-secondary');
                });
            }
        });
    });

</script>
