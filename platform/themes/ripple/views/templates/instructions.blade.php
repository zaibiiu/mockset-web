<section class="instructions-section py-5">
    <div class="container">
        <h2 class="section-title text-left">{{ $paper->name }} Solutions</h2>
        @if (request()->has('score'))
            <div class="score-container">
                <div class="score-badge">
                    <p class="score-text">Score </p>
                    <p class="score-number">{{ request()->query('score') }}</p>
                </div>
            </div>
        @endif
        @foreach ($questionsWithAnswers as $index => $question)
            <div id="question-{{ $index }}" class="question-card {{ $index === 0 ? 'active' : '' }}">
                <h4 class="question-title">Question {{ $index + 1 }}</h4>
                <p class="question-description">{{ $question->question }}</p>
                @foreach ($question->answers as $answerIndex => $answer)
                    <!-- Display answers -->
                    <div class="custom-answer-list">
                        <div class="custom-answer-option {{ $incorrectAnswers[$index] ?? '' === 'a' ? 'incorrect' : '' }}" data-answer="a">
                            <span class="custom-answer-number">a.</span>
                            <span class="custom-answer-text">{{ $answer->answer_1 }}</span>
                            @if ($answer->is_answer_1)
                                <span class="correct-answer-text">Correct Answer</span>
                            @endif
                            @if ($incorrectAnswers[$index] ?? '' === 'a')
                                <span class="incorrect-answer-text">Incorrect Answer</span>
                            @endif
                        </div>
                        <div class="custom-answer-option {{ $incorrectAnswers[$index] ?? '' === 'b' ? 'incorrect' : '' }}" data-answer="b">
                            <span class="custom-answer-number">b.</span>
                            <span class="custom-answer-text">{{ $answer->answer_2 }}</span>
                            @if ($answer->is_answer_2)
                                <span class="correct-answer-text">Correct Answer</span>
                            @endif
                            @if ($incorrectAnswers[$index] ?? '' === 'b')
                                <span class="incorrect-answer-text">Incorrect Answer</span>
                            @endif
                        </div>
                        <div class="custom-answer-option {{ $incorrectAnswers[$index] ?? '' === 'c' ? 'incorrect' : '' }}" data-answer="c">
                            <span class="custom-answer-number">c.</span>
                            <span class="custom-answer-text">{{ $answer->answer_3 }}</span>
                            @if ($answer->is_answer_3)
                                <span class="correct-answer-text">Correct Answer</span>
                            @endif
                            @if ($incorrectAnswers[$index] ?? '' === 'c')
                                <span class="incorrect-answer-text">Incorrect Answer</span>
                            @endif
                        </div>
                        <div class="custom-answer-option {{ $incorrectAnswers[$index] ?? '' === 'd' ? 'incorrect' : '' }}" data-answer="d">
                            <span class="custom-answer-number">d.</span>
                            <span class="custom-answer-text">{{ $answer->answer_4 }}</span>
                            @if ($answer->is_answer_4)
                                <span class="correct-answer-text">Correct Answer</span>
                            @endif
                            @if ($incorrectAnswers[$index] ?? '' === 'd')
                                <span class="incorrect-answer-text">Incorrect Answer</span>
                            @endif
                        </div>
                    </div>
                    <button class="view-description-btn">View Solution</button>
                    <div class="answer-description">
                        {{ $answer->description }}
                    </div>
                @endforeach
            </div>
        @endforeach
    </div>
</section>

<script>
    document.querySelectorAll('.view-description-btn').forEach(button => {
        button.addEventListener('click', () => {
            const answerOption = button.closest('.custom-answer-option');
            const description = button.nextElementSibling;
            button.closest('.question-card').querySelectorAll('.answer-description').forEach(desc => {
                if (desc !== description) {
                    desc.style.display = 'none';
                }
            });

            description.style.display = description.style.display === 'block' ? 'none' : 'block';
        });
    });

</script>
