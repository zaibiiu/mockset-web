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

    <div class="col-lg-9 col-12" id="mocktest-papers">
        @foreach ($papers as $paper)
            @if ($paper->paper_type == \Botble\QuizManager\Enums\PaperTypeEnum::MOCKTEST)
                <div class="col-12 mb-4">
                    <div id="messageContainer" style="display: none;"></div>
                    <div class="paper-card {{ ($paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::BUY && !auth('member')->check()) ? 'disabled-card' : '' }}">
                        <div class="paper-status-badge
                    {{ $paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::FREE ? 'badge-free' :
                       ($paper->remaining_attempts > 0 ? 'badge-owned' : 'badge-paid') }}">
                            {{ $paper->remaining_attempts > 0 ? 'GO!' : ucfirst($paper->paper_status) }}
                        </div>

                        <div class="paper-card-icon">
                            <i class="fas fa-file-alt paper-icon"></i>
                        </div>

                        <div class="paper-card-content">
                            <h3 class="paper-title">{{ $paper->name }}</h3>
                            <p style="font-size: 16px; color: grey; font-weight: 500;">
                                {{ $paper->description }}
                            </p>

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

                        @if ($paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::BUY)
                            @if ($paper->remaining_attempts > 0)
                                <div class="paper-total-attempt"
                                     style="display: inline-block; font-size: 16px; font-weight: 500; color: #800080; margin-top: 8px;
            border: 2px solid #800080;
            background-color: #e6e6fa;
           ">
                                    Remaining attempt(s): {{ $paper->remaining_attempts }}
                                </div>

                                <button class="start-test-btn" onclick="checkRemainingAttempts('{{ $paper->id }}')">
                                    Start Test
                                </button>
                            @else
                                <div class="paper-total-attempt">
                                    <i class="fas fa-dollar-sign"></i>
                                    Price: {{ number_format($paper->price, 2) }}
                                </div>

                                <button class="start-test-btn"
                                        onclick="showInstructionModal(
                                    '{{ $paper->name }}',
                                    {{ $paper->question_count }},
                                    {{ $paper->time }},
                                    '{{ $paper->id }}',
                                    true,
                                    0
                                )">
                                    Pay Now & Start Test
                                </button>
                            @endif

                            @if (!auth('member')->check())
                                <p class="access-message">You can attempt this paper after logging in.</p>
                            @endif
                        @elseif ($paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::FREE)
                            <button class="start-test-btn"
                                    onclick="showInstructionModal(
                                '{{ $paper->name }}',
                                {{ $paper->question_count }},
                                {{ $paper->time }},
                                '{{ $paper->id }}',
                                false
                            )">
                                Start Test
                            </button>
                        @endif
                    </div>
                </div>
            @endif
        @endforeach
    </div>

    <div id="instructionModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeInstructionModal()">&times;</span>
            <h2 id="instructionTitle">Instructions</h2>
            <p id="instructionText"></p>
            <button id="payNowBtn" class="start-test-btn" style="display: none;">Pay Now</button>
            <button id="startTestBtn" class="start-test-btn"
                    data-is-buy-paper="false"
                    data-remaining-attempts="0"
                    data-test-url=""
                    onclick="startTest()">
                Start Test
            </button>
        </div>
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

<script>

    function checkRemainingAttempts(paperId) {
        $.ajax({
            url: `/check-attempts/${paperId}`,
            method: 'GET',
            success: function(response) {
                if (response.success && response.remaining_attempts > 0) {
                    showInstructionModal(
                        response.paper_name,
                        response.question_count,
                        response.time,
                        response.paper_id,
                        false,
                        response.remaining_attempts
                    );
                } else {
                    // Display the message directly without alert
                    const messageContainer = document.getElementById('messageContainer');
                    if (messageContainer) {
                        messageContainer.textContent = response.message || 'You have no remaining attempts for this test.';
                        messageContainer.style.color = 'red'; // Set the message color to red for errors
                        messageContainer.style.display = 'block';
                    }
                }
            },
            error: function() {
                // Display a generic error message
                const messageContainer = document.getElementById('messageContainer');
                if (messageContainer) {
                    messageContainer.textContent = 'Error checking remaining attempts. Please try again.';
                    messageContainer.style.color = 'red';
                    messageContainer.style.display = 'block';
                }
            }
        });
    }


    function hideInstructionModal() {
        const modal = document.getElementById('instructionModal');
        if (modal) {
            modal.style.display = 'none';
        }
    }

    function showInstructionModal(paperName, questionCount, totalTime, paperId, isBuyPaper = false, remainingAttempts = 0) {
        var modal = document.getElementById('instructionModal');
        var instructionTitle = document.getElementById('instructionTitle');
        var instructionText = document.getElementById('instructionText');
        var startTestBtn = document.getElementById('startTestBtn');
        var payNowBtn = document.getElementById('payNowBtn');

        if (!modal || !instructionTitle || !instructionText || !startTestBtn || !payNowBtn) {
            return;
        }

        instructionTitle.textContent = 'Instructions for ' + paperName;
        instructionText.innerHTML = questionCount > 0
            ? `The Question Paper will include ${questionCount} questions, and you will have ${totalTime} minutes in total.`
            : 'N/A (No questions available)';

        const testUrl = `/paper/${paperId}/question`;
        startTestBtn.setAttribute('data-test-url', testUrl);
        startTestBtn.setAttribute('data-is-buy-paper', isBuyPaper);
        startTestBtn.setAttribute('data-remaining-attempts', remainingAttempts);

        payNowBtn.onclick = function () {
            window.location.href = `/paper/${paperId}/paper-payment`;
        };

        if (isBuyPaper) {
            payNowBtn.style.display = 'block';
            startTestBtn.style.display = 'none';
        } else {
            startTestBtn.style.display = 'block';
            payNowBtn.style.display = 'none';
        }

        modal.style.display = 'block';
    }

    function startTest() {
        const startTestBtn = document.querySelector('#startTestBtn');
        const testUrl = startTestBtn.getAttribute('data-test-url');
        const paperId = testUrl.split('/')[2];
        var csrfToken = '{{ csrf_token() }}';

        if (!testUrl) {
            return;
        }

        hideInstructionModal();

        if (testUrl) {
            localStorage.removeItem('currentIndex');
            localStorage.removeItem('paperTimer');
            localStorage.removeItem('questionTimers');
            localStorage.removeItem('questionCompleted');
            localStorage.removeItem('answers');
            sessionStorage.removeItem('paperCompleted');

            window.location.href = testUrl;
        }

        fetch(`/paper/${paperId}/deduct-attempt`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': csrfToken,
            },
            body: JSON.stringify({}),
        })
            .then(response => {
                if (!response.ok) throw new Error('Network response was not ok');
                return response.json();
            })
            .then(data => {
                console.log('Deduction successful:', data);
                window.location.href = testUrl;
            })
            .catch(error => {
                console.error('There was a problem with the deduct attempt:', error);
            });
    }

    function closeInstructionModal() {
        var modal = document.getElementById('instructionModal');
        if (modal) {
            modal.style.display = 'none';
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

