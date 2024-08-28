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
<style>
    .instructions-section {
        padding: 2rem 0;
    }


    .score-container {
        display: flex;
        justify-content: center;
        margin-bottom: 1.5rem;
    }

    .score-badge {
        background: #007bff; /* Solid blue background for better contrast */
        color: #FFD700; /* Yellow text color */
        border-radius: 50%;
        width: 120px;
        height: 120px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Slightly reduced shadow for a cleaner look */
        position: relative;
        text-align: center;
        padding: 10px; /* Ensure text fits well inside */
        font-family: Arial, sans-serif; /* Clean and modern font */
    }

    .score-text {
        font-size: 0.875rem; /* Smaller size for better fit */
        font-weight: normal;
        margin: 0; /* Remove margin to avoid overflow */
        color: white;
    }

    .score-number {
        font-size: 2.5rem; /* Adjust as needed */
        font-weight: bold;
        margin: 0; /* Remove margin to avoid overflow */
        line-height: 1.2; /* Ensure proper line height */
        color: white;
        font-style: italic;
    }

    .section-title {
        font-size: 2rem;
        font-weight: bold;
        margin-bottom: 1.5rem;
    }

    .question-card {
        border: 1px solid #ddd;
        padding: 1.5rem;
        border-radius: 8px;
        background-color: #fff; /* Background color for the card */
        margin-bottom: 1.5rem;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        position: relative; /* Position relative to contain absolutely positioned elements */
    }

    .question-title {
        font-size: 1.5rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
    }

    .correct-answer-text {
        display: block;
        font-size: 0.875rem; /* Smaller font size for the correct text */
        color: green; /* Green color for correct answer */
        font-weight: bold;
        margin-top: 0.25rem; /* Margin to separate from the answer text */
    }

    .question-description {
        font-size: 1.2rem;
        margin-bottom: 1rem;
    }

    .custom-answer-list {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem; /* Space between answer items */
    }

    .custom-answer-option {
        border: 1px solid #ddd;
        padding: 0.75rem;
        border-radius: 8px;
        background-color: #fafafa;
        width: calc(50% - 0.5rem); /* Two options per row */
        box-sizing: border-box; /* Ensure padding and border are included in width */
        position: relative; /* To position the description box within it */
    }

    .custom-answer-number {
        font-weight: bold;
        margin-right: 0.5rem;
    }

    .custom-answer-text {
        font-size: 1rem;
    }

    .view-description-btn {
        display: block;
        margin-top: 0.5rem; /* Margin to separate from the answer text */
        padding: 0.25rem 0.5rem; /* Smaller padding */
        font-size: 0.875rem; /* Smaller font size */
        font-weight: bold;
        color: #007bff;
        background-color: #e7f0ff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .answer-description {
        display: none; /* Initially hide all descriptions */
        margin-top: 0.5rem;
        padding: 0.5rem;
        border: 1px solid #ddd;
        border-radius: 4px; /* Adjusted border radius for description box */
        background-color: #f9f9f9;
        position: relative; /* Position relative to stay within answer option */
        width: calc(100% - 2px); /* Same width as the answer option */
        box-sizing: border-box; /* Include padding and border in width */
    }
    .incorrect-answer-text {
        display: block;
        font-size: 0.875rem;
        color: red; /* Red color for incorrect answers */
        font-weight: bold;
        margin-top: 0.25rem; /* Margin to separate from the answer text */
    }


</style>

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
