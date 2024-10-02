<div class="container">
    <h2 class="user-papers-title">Your Previous Test Attempts</h2>

    @if($completedPapers->isEmpty())
        <p class="no-papers-message">You have not completed any tests yet.</p>
    @else
        @foreach ($completedPapers as $quizManagerId => $papers)
            <div class="quiz-manager-section">
                <h3 class="quiz-manager-name section-title text-left">{{ $papers->first()->paper->quizManager->name }} Papers</h3>
                    @foreach ($papers as $score)
                        @php
                            $wrongAnswers = json_decode($score->wrong_answers, true);
                        @endphp
                        <div class="col-md-12 mb-4">
                            <div class="paper-item-card">
                                <div class="paper-item-content">
                                    <div class="paper-item-name">
                                        {{ $score->paper->name }}
                                    </div>
                                    <div class="paper-item-badges">
                                        <div class="badge-score">Score: {{ $score->user_score }}</div>
                                        <div class="badge-status {{ $score->status == 1 ? 'badge-pass' : 'badge-fail' }}">
                                            {{ $score->status == 1 ? 'Pass' : 'Fail' }}
                                        </div>
                                    </div>
                                    <a class="view-full-paper-btn" onclick="togglePaperDetails({{ $score->paper->id }})">
                                        View Full Paper
                                    </a>
                                    <div id="paper-details-{{ $score->paper->id }}" class="paper-details-container" style="display: none;">
                                        @if($score->paper->questions)
                                            @foreach ($score->paper->questions as $index => $question)
                                                <div id="question-{{ $index }}" class="instruction-card {{ $index === 0 ? 'active' : '' }}">
                                                    <h4 class="question-title">Question {{ $index + 1 }}</h4>
                                                    <p class="question-description">{{ $question->question }}</p>
                                                    @foreach ($question->answers as $answerIndex => $answer)
                                                        <div class="custom-answer-list">
                                                            <div class="custom-answer-option" data-answer="a">
                                                                <span class="custom-answer-number">a.</span>
                                                                <span class="custom-answer-text">{{ $answer->answer_1 }}</span>
                                                                @if ($answer->is_answer_1)
                                                                    <span class="correct-answer-text">Correct Answer</span>
                                                                @endif
                                                            </div>
                                                            <div class="custom-answer-option" data-answer="b">
                                                                <span class="custom-answer-number">b.</span>
                                                                <span class="custom-answer-text">{{ $answer->answer_2 }}</span>
                                                                @if ($answer->is_answer_2)
                                                                    <span class="correct-answer-text">Correct Answer</span>
                                                                @endif
                                                            </div>
                                                            <div class="custom-answer-option" data-answer="c">
                                                                <span class="custom-answer-number">c.</span>
                                                                <span class="custom-answer-text">{{ $answer->answer_3 }}</span>
                                                                @if ($answer->is_answer_3)
                                                                    <span class="correct-answer-text">Correct Answer</span>
                                                                @endif
                                                            </div>
                                                            <div class="custom-answer-option" data-answer="d">
                                                                <span class="custom-answer-number">d.</span>
                                                                <span class="custom-answer-text">{{ $answer->answer_4 }}</span>
                                                                @if ($answer->is_answer_4)
                                                                    <span class="correct-answer-text">Correct Answer</span>
                                                                @endif
                                                            </div>

                                                            @php
                                                                $selectedAnswerText = '';
                                                                if (isset($wrongAnswers[$index])) {
                                                                    switch ($wrongAnswers[$index]['selectedAnswer']) {
                                                                        case 'answer_1':
                                                                            $selectedAnswerText = $answer->answer_1 ?? '';
                                                                            break;
                                                                        case 'answer_2':
                                                                            $selectedAnswerText = $answer->answer_2 ?? '';
                                                                            break;
                                                                        case 'answer_3':
                                                                            $selectedAnswerText = $answer->answer_3 ?? '';
                                                                            break;
                                                                        case 'answer_4':
                                                                            $selectedAnswerText = $answer->answer_4 ?? '';
                                                                            break;
                                                                    }
                                                                }
                                                            @endphp

                                                            @if (!empty($selectedAnswerText))
                                                                <div class="solution-user-wrong-answer">
                                                                    <p>Your selected wrong answer:
                                                                        <strong>{{ $selectedAnswerText }}</strong></p>
                                                                </div>
                                                            @elseif (isset($wrongAnswers[$index]))
                                                                <p class="error-message">Error: Answer text not found.</p>
                                                            @endif
                                                        </div>
                                                        <button class="view-description-btn" onclick="toggleDescription(this)">View Solution</button>
                                                        <div class="answer-description" style="display: none;">
                                                            {!! $answer->description !!}
                                                        </div>
                                                    @endforeach
                                                </div>
                                            @endforeach
                                        @else
                                            <p>No questions available for this paper.</p>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
            </div>
        @endforeach
    @endif
</div>


<script>
    function togglePaperDetails(paperId) {
        var detailsContainer = document.getElementById('paper-details-' + paperId);
        var questionCards = detailsContainer.querySelectorAll('.question-card');

        if (detailsContainer.style.display === 'none') {
            detailsContainer.style.display = 'block';
            questionCards.forEach(card => card.classList.add('expanded'));
        } else {
            detailsContainer.style.display = 'none';
            questionCards.forEach(card => card.classList.remove('expanded'));
        }
    }

    function toggleDescription(button) {
        var description = button.nextElementSibling;
        if (description.style.display === 'none') {
            description.style.display = 'block';
            button.textContent = 'Hide Solution';
        } else {
            description.style.display = 'none';
            button.textContent = 'View Solution';
        }
    }

</script>

<style>
    @media (max-width: 768px) {
        .instruction-card {
            padding: 10px;
            margin: 10px;
        }
    }
</style>
