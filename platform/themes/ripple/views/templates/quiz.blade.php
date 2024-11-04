<style>
    .header{
        display: none;
    }
    .page-header{
        display: none;
    }
    .page-footer{
        display: none;
    }
</style>

<!-- Info Message -->
<div style="background-color: #d4edda; color: #155724; text-align: center; padding: 10px; border: 1px solid #c3e6cb; margin: 10px 0; margin-bottom: 25px">
    <span style="font-weight: bold;">🔍</span>
    <span style="font-weight: bold;"> You can view the solution to know the explanation about the question.</span>
</div>

@foreach ($questionsWithAnswers as $index => $question)
    <div id="question-{{ $index }}" class="instruction-card {{ $index === 0 ? 'active' : '' }}">
        <h4 class="question-title">Question {{ $index + 1 }}</h4>
        <p class="question-description">{{ $question->question }}</p>

        @foreach ($question->answers as $answerIndex => $answer)
            <!-- Display answers with icons -->
            <div class="custom-answer-list">
                <div class="custom-answer-option" data-answer="a" data-correct="{{ $answer->is_answer_1 ? 'true' : 'false' }}">
                    <span class="custom-answer-number">a.</span>
                    <span class="custom-answer-text">{{ $answer->answer_1 }}</span>
                    <span class="answer-feedback"></span> <!-- Placeholder for check or cross icon -->
                </div>
                <div class="custom-answer-option" data-answer="b" data-correct="{{ $answer->is_answer_2 ? 'true' : 'false' }}">
                    <span class="custom-answer-number">b.</span>
                    <span class="custom-answer-text">{{ $answer->answer_2 }}</span>
                    <span class="answer-feedback"></span>
                </div>
                <div class="custom-answer-option" data-answer="c" data-correct="{{ $answer->is_answer_3 ? 'true' : 'false' }}">
                    <span class="custom-answer-number">c.</span>
                    <span class="custom-answer-text">{{ $answer->answer_3 }}</span>
                    <span class="answer-feedback"></span>
                </div>
                @if ($answer->answer_4)
                    <div class="custom-answer-option" data-answer="d" data-correct="{{ $answer->is_answer_4 ? 'true' : 'false' }}">
                        <span class="custom-answer-number">d.</span>
                        <span class="custom-answer-text">{{ $answer->answer_4 }}</span>
                        <span class="answer-feedback"></span>
                    </div>
                @endif
            </div>
            <button class="view-description-btn">View Solution</button>
            <div class="answer-description" style="display: none;">
                {!! $answer->description !!}
            </div>
        @endforeach
    </div>
@endforeach

<div id="test-score" class="score-container" style="display:none;">
    <h3>Your Score: <span id="user-score" class="score"></span> / <span id="total-marks" class="total-marks"></span></h3>
</div>

<button id="finish-test-btn" class="finish-test-btn" disabled style="float: right">Finish Test</button>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const answerOptions = document.querySelectorAll('.custom-answer-option');
        let correctAnswersCount = 0;
        let totalAnsweredQuestions = 0; // To track answered questions
        const totalQuestions = {{ $paper->question_count }}; // Total questions from the paper
        const finishButton = document.getElementById('finish-test-btn');

        // Disable the finish button initially
        finishButton.disabled = true;

        answerOptions.forEach(option => {
            option.addEventListener('click', function () {
                const parent = this.closest('.custom-answer-list');

                // Check if the question has already been answered
                if (parent.classList.contains('answered')) return;  // Prevent multiple answers

                parent.classList.add('answered');  // Mark question as answered
                totalAnsweredQuestions++;  // Increment total answered questions

                // Check if all questions are answered to enable the finish button
                if (totalAnsweredQuestions === totalQuestions) {
                    finishButton.disabled = false;
                }

                parent.querySelectorAll('.custom-answer-option').forEach(item => {
                    item.classList.remove('correct', 'wrong', 'highlight');
                    item.querySelector('.answer-feedback').innerHTML = '';
                });

                const isCorrect = this.dataset.correct === 'true';

                if (isCorrect) {
                    this.classList.add('correct');
                    this.querySelector('.answer-feedback').innerHTML = '<div class="icon-circle correct-icon">✔</div>';
                    correctAnswersCount++;  // Increment correct answer count
                } else {
                    this.classList.add('wrong');
                    this.querySelector('.answer-feedback').innerHTML = '<div class="icon-circle wrong-icon">✘</div>';
                    parent.querySelector('.custom-answer-option[data-correct="true"]').classList.add('correct', 'highlight');
                    parent.querySelector('.custom-answer-option[data-correct="true"] .answer-feedback').innerHTML = '<div class="icon-circle correct-icon">✔</div>';
                }
            });
        });

        // Enable the view description button to toggle answer description
        const viewDescriptionButtons = document.querySelectorAll('.view-description-btn');
        viewDescriptionButtons.forEach(button => {
            button.addEventListener('click', function () {
                const parent = this.parentNode;
                const answerDescription = parent.querySelector('.answer-description');
                answerDescription.style.display = answerDescription.style.display === 'block' ? 'none' : 'block';
            });
        });

        // Score Calculation on "Finish Test" Button Click
        finishButton.addEventListener('click', function () {
            const marksPerQuestion = {{ $paper->marks_per_question }};
            const totalMarks = totalQuestions * marksPerQuestion;

            // Calculate user score
            const userScore = correctAnswersCount * marksPerQuestion;

            // Display score
            document.getElementById('user-score').textContent = userScore;
            document.getElementById('total-marks').textContent = totalMarks;
            document.getElementById('test-score').style.display = 'block';
        });
    });
</script>


<style>

    .custom-answer-option.correct {
        border-color: green;
    }

    .custom-answer-option.wrong {
        border-color: red;
    }

    .custom-answer-option .answer-feedback {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
    }

    .icon-circle {
        display: inline-flex;
        justify-content: center;
        align-items: center;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        font-size: 14px;
        font-weight: bold;
        color: white;
    }

    .correct-icon {
        background-color: green;
    }

    .wrong-icon {
        background-color: red;
    }

    .custom-answer-list.answered .custom-answer-option {
        pointer-events: none;
        cursor: default;
    }

    .finish-test-btn:disabled {
        cursor: not-allowed;
        background-color: grey;
    }

    .finish-test-btn {
        background-color: #28a745;
        color: white;
        padding: 10px 80px;
        border: none;
        cursor: pointer;
        font-size: 16px;
        margin-top: 0;
    }

    .score-container {
        background-color: #f9f9f9;
        border: 2px solid #4caf50;
        padding: 10px;
        margin-top: 20px;
        text-align: center;
        border-radius: 2px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Soft shadow for 3D effect */
    }

    .score-container h3 {
        font-size: 24px;
        font-weight: 600;
        color: #333;
    }

    .score {
        font-size: 28px;
        font-weight: 500;
        color: #4caf50; /* Green color for the score */
    }

    .total-marks {
        font-size: 24px;
        font-weight: 500;
        color: #333;
    }

    .icon-circle {
        display: inline-block;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        text-align: center;
        line-height: 20px;
        font-size: 12px;
        margin-left: 10px;
    }

    .correct-icon {
        background-color: green;
        color: white;
    }

    .wrong-icon {
        background-color: red;
        color: white;
    }

</style>
