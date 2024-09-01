@if(!auth('member')->check())
    <a href="{{ route('public.member.login') }}"
       class="checkout-badge rounded d-block mt-2"
       style="background-color: #f8d7da; color: #721c24; padding: 10px 15px; text-align: center; border-radius: .375rem; margin-bottom: 20px; font-weight: 500; box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);">
        Already have an account?
        <strong> Click here to login</strong>
    </a>
@endif

@foreach ($papers as $paper)
    <div class="col-12 mb-4">
        <div class="paper-card">
            <div class="paper-card-icon">
                <i class="fas fa-file-alt paper-icon"></i>
                <div class="paper-status-badge {{ $paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::FREE ? 'badge-free' : 'badge-paid' }}">
                    {{ ucfirst($paper->paper_status) }}
                </div>
            </div>
            <div class="paper-card-content">
                <h3 class="paper-title">{{ $paper->name }}</h3>
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
                <div class="paper-total-attempt" style="font-style: italic; font-size: 1.2em; color: #4CAF50; font-weight: bold; padding: 10px; border: 1px solid #4CAF50; border-radius: 5px; background-color: #f9f9f9;">
        <span style="display: inline-block; margin-right: 5px;">
            <i class="fas fa-dollar-sign" style="color: #4CAF50;"></i>
        </span>
                    Price: {{ number_format($paper->price, 2) }}
                </div>
            @endif
        @if($paper->paper_status == \Botble\QuizManager\Enums\PaperStatusEnum::BUY)
                <button class="start-test-btn"
                        onclick="showInstructionModal('{{ $paper->name }}', {{ $paper->question_count }}, {{ $paper->time }}, '', '{{ route('public.paper.make-payment', $paper->id) }}', '{{ route('public.paper.payment', $paper->id) }}', '{{ route('public.paper.cancel', $paper->id) }}')">
                    Pay Now & Start Test
                </button>
            @else
                <button class="start-test-btn"
                        onclick="showInstructionModal('{{ $paper->name }}', {{ $paper->question_count }}, {{ $paper->time }}, '{{ route('paper_list', ['paper_id' => $paper->id]) }}')">
                    Start Test
                </button>
            @endif
        </div>
    </div>
@endforeach

<!-- Instruction Modal -->
<div id="instructionModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeInstructionModal()">&times;</span>
        <h2 id="instructionTitle">Instructions</h2>
        <p id="instructionText">
            <!-- Content will be set dynamically by JavaScript -->
        </p>
        <div id="paymentSection" style="display: none;">
            <h4 class="mb-3">Select Payment Method</h4>
            <span class="spacer"></span>
            <div class="col-xs-12 mt-4 mb-4">
                <form id="paymentForm" action="" method="post">
                    @csrf
                    <link rel="stylesheet"
                          href="{{ asset('vendor/core/plugins/payment/css/payment.css') }}?v=1.1.0">
                    @include('plugins/payment::partials.payment-methods-for-payment', [
'action'       => '',
'currency'     => cms_currency()->getDefaultCurrency()->title,
'amount'       => '',
'name'         => '',
'returnUrl'    => '',
'callbackUrl'  => '',
])
                    <button type="submit" class="start-test-btn btn btn-primary btn-md w-auto mt-4">
                        Pay Now & Start Test
                    </button>
                </form>
            </div>
        </div>
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
</script>
