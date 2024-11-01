@php
    $wrongAnswers = json_decode(urldecode(request('wrongAnswers')), true);
@endphp
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
            <div id="question-{{ $index }}" class="instruction-card {{ $index === 0 ? 'active' : '' }}">
                <h4 class="question-title">Question {{ $index + 1 }}</h4>
                <p class="question-description">{!! $question->question !!}</p>
                @foreach ($question->answers as $answerIndex => $answer)
                    <!-- Display answers -->
                    <div class="custom-answer-list">
                        <div class="custom-answer-option {{ isset($wrongAnswers[$index]) && $wrongAnswers[$index]['selectedAnswer'] === 'answer_1' ? 'incorrect' : '' }}" data-answer="a">
                            <span class="custom-answer-number">a.</span>
                            <span class="custom-answer-text">{{ $answer->answer_1 }}</span>
                            @if ($answer->is_answer_1)
                                <span class="correct-answer-text">Correct Answer</span>
                            @endif
                            <style>
                                .custom-answer-option {
                                    margin-bottom: 20px; /* Space between answer options */
                                }

                                .custom-answer-wrapper {
                                    display: flex;
                                    align-items: baseline; /* Aligns the text and the option number */
                                }

                                .custom-answer-number {
                                    margin-right: 10px; /* Space between 'a.' and the answer text */
                                    font-weight: bold;
                                }

                                .custom-answer-text {
                                    display: inline-block;
                                    vertical-align: baseline; /* Aligns answer text with the option number */
                                }

                                .correct-answer-text {
                                    margin-top: 5px; /* Adds some space between the answer and "Correct Answer" */
                                    display: block; /* Ensures it appears below the answer text */
                                    color: green; /* Style for correct answer text */
                                    font-weight: bold;
                                }

                            </style>
                        </div>
                        <div class="custom-answer-option {{ isset($wrongAnswers[$index]) && $wrongAnswers[$index]['selectedAnswer'] === 'answer_2' ? 'incorrect' : '' }}" data-answer="b">
                            <span class="custom-answer-number">b.</span>
                            <span class="custom-answer-text">{{ $answer->answer_2 }}</span>
                            @if ($answer->is_answer_2)
                                <span class="correct-answer-text">Correct Answer</span>
                            @endif
                        </div>
                        <div class="custom-answer-option {{ isset($wrongAnswers[$index]) && $wrongAnswers[$index]['selectedAnswer'] === 'answer_3' ? 'incorrect' : '' }}" data-answer="c">
                            <span class="custom-answer-number">c.</span>
                            <span class="custom-answer-text">{{ $answer->answer_3 }}</span>
                            @if ($answer->is_answer_3)
                                <span class="correct-answer-text">Correct Answer</span>
                            @endif
                        </div>
                        @if ($answer->answer_4)
                        <div class="custom-answer-option {{ isset($wrongAnswers[$index]) && $wrongAnswers[$index]['selectedAnswer'] === 'answer_4' ? 'incorrect' : '' }}" data-answer="d">
                            <span class="custom-answer-number">d.</span>
                            <span class="custom-answer-text">{{ $answer->answer_4 }}</span>
                            @if ($answer->is_answer_4)
                                <span class="correct-answer-text">Correct Answer</span>
                            @endif
                        </div>
                        @endif
                        <!-- Only show wrong answer if it exists for this specific question -->
                        @if (!empty($wrongAnswers))
                            @foreach ($wrongAnswers as $wrongAnswer)
                                @if ($wrongAnswer['questionIndex'] == $index)
                                    @php
                                        // Initialize selectedAnswerText to empty string
                                        $selectedAnswerText = '';

                                        // Find the selected answer based on the wrongAnswer's selectedAnswer value
                                        switch ($wrongAnswer['selectedAnswer']) {
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
                                    @endphp
                                    @if (!empty($selectedAnswerText))
                                        <div class="solution-user-wrong-answer">
                                            <p>Your selected wrong answer:
                                                <strong>{{ $selectedAnswerText }}</strong></p>
                                        </div>
                                    @else
                                        <p style="color: red;">Error: Answer text not found.</p>
                                    @endif
                                @endif
                            @endforeach
                        @endif

                    </div>
                    <button class="view-description-btn">View Solution</button>
                    <div class="answer-description">
                        {!! $answer->description !!}
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
            button.closest('.instruction-card').querySelectorAll('.answer-description').forEach(desc => {
                if (desc !== description) {
                    desc.style.display = 'none';
                }
            });

            description.style.display = description.style.display === 'block' ? 'none' : 'block';
        });
    });

</script>
