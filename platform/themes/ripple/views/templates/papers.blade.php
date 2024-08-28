<section class="papers-section py-5">
    <div class="container">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="section-title text-left">{{ $subject->name }} Papers</h2>
            </div>
        </div>

        @if(!auth('member')->check())
            <div class="row mb-4">
                <div class="col-12">
                    <a href="{{ route('public.member.login') }}" class="login-banner" style="background-color: #f8d7da; padding: 15px; border-radius: 8px; display: block; text-align: center; color: #333; font-weight: 500;">
                        Already have an account?
                        <strong> Click here to login</strong>
                    </a>
                </div>
            </div>
        @endif

        <div class="row">
            @if($papers->isEmpty())
                <div class="col-12">
                    <p class="no-papers-text">No papers available for this subject at the moment.</p>
                </div>
            @else
                @foreach ($papers as $paper)
                    <div class="col-12 mb-4">
                        <div class="paper-card">
                            <div class="paper-card-icon">
                                <i class="fas fa-file-alt paper-icon"></i>
                                <div class="paper-status-badge {{ $paper->paper_status == 'free' ? 'badge-free' : 'badge-paid' }}">
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
                            <div class="paper-total-attempt">
                                Total Attempt: {{ $paper->total_attempts }}
                            </div>
                            <button class="start-test-btn"
                                    onclick="showInstructionModal('{{ $paper->name }}', {{ $paper->question_count }}, {{ $paper->time }}, '{{ route('paper_list', ['paper_id' => $paper->id]) }}')">
                                Start Test
                            </button>
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
</section>
<!-- Instruction Modal -->
<div id="instructionModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeInstructionModal()">&times;</span>
        <h2 id="instructionTitle">Instructions</h2>
        <p id="instructionText">
            <!-- Content will be set dynamically by JavaScript -->
        </p>
        <button class="start-test-btn" onclick="startTest()">Start Test</button>
    </div>
</div>
<script>
    function showInstructionModal(paperName, questionCount, totalTime, testUrl) {
        var modal = document.getElementById('instructionModal');
        var instructionTitle = document.getElementById('instructionTitle');
        var instructionText = document.getElementById('instructionText');

        instructionTitle.textContent = 'Instructions for ' + paperName;
        if (questionCount > 0) {
            instructionText.innerHTML = `The Question Paper will include ${questionCount} questions, and for each question, you will have 15 seconds.`;
        } else {
            instructionText.textContent = 'N/A (No questions available)';
        }

        // Reset the start test button's URL
        document.querySelector('.start-test-btn').setAttribute('data-test-url', testUrl);

        modal.style.display = 'block';
    }

    function closeInstructionModal() {
        document.getElementById('instructionModal').style.display = 'none';
    }

    function startTest() {
        var testUrl = document.querySelector('.start-test-btn').getAttribute('data-test-url');
        closeInstructionModal();
        if (testUrl) {
            localStorage.removeItem('currentIndex');
            localStorage.removeItem('paperTimer');
            localStorage.removeItem('questionTimers');
            localStorage.removeItem('questionCompleted');
            localStorage.removeItem('answers');
            sessionStorage.removeItem('paperCompleted');

            window.location.href = testUrl;
        } else {
            console.error('Test URL is not defined');
        }
    }


    window.onclick = function(event) {
        if (event.target === document.getElementById('instructionModal')) {
            closeInstructionModal();
        }
    };

</script>
