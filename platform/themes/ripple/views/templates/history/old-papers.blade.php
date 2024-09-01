<div class="user-papers-container">
    <h2 class="user-papers-title">Your Previous Test Attempts</h2>

    @if($completedPapers->isEmpty())
        <p class="no-papers-message">You have not completed any tests yet.</p>
    @else
        <div class="user-papers-grid">
            @foreach ($completedPapers as $score)
                @php
                    $wrongAnswers = json_decode($score->wrong_answers, true);
                @endphp
                <div class="paper-item-card">
                    <div class="paper-item-content">
                        <div class="paper-item-name">
                            {{ $score->paper->name }}
                        </div>
                        <button class="view-full-paper-btn" onclick="togglePaperDetails({{ $score->paper->id }})">
                            View Full Paper
                        </button>
                        <div class="paper-item-badges">
                            <div class="badge-score">Score: {{ $score->user_score }}</div>
                            <div class="badge-status {{ $score->status == 1 ? 'badge-pass' : 'badge-fail' }}">
                                {{ $score->status == 1 ? 'Pass' : 'Fail' }}
                            </div>
                        </div>
                        <div id="paper-details-{{ $score->paper->id }}" class="paper-details-container" style="display: none;">
                            @if($score->paper->questions)
                                @foreach ($score->paper->questions as $index => $question)
                                    <div id="question-{{ $index }}" class="question-card {{ $index === 0 ? 'active' : '' }}">
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
                                                    <div class="user-wrong-answer">
                                                        <p><strong>Your selected wrong answer:</strong></p>
                                                        <p class="incorrect-answer-text">{{ $selectedAnswerText }}</p>
                                                    </div>
                                                @elseif (isset($wrongAnswers[$index]))
                                                    <p class="error-message">Error: Answer text not found.</p>
                                                @endif
                                            </div>
                                            <button class="view-description-btn" onclick="toggleDescription(this)">View Solution</button>
                                            <div class="answer-description" style="display: none;">
                                                {{ $answer->description }}
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
            @endforeach
        </div>
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
        var description = button.nextElementSibling; // Assuming the description is the next sibling
        if (description.style.display === 'none') {
            description.style.display = 'block';
            button.textContent = 'Hide Solution'; // Optional: Change button text
        } else {
            description.style.display = 'none';
            button.textContent = 'View Solution'; // Optional: Change button text back
        }
    }


</script>

<style>
    .user-papers-container {
        padding: 20px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .user-papers-title {
        font-size: 2rem;
        margin-bottom: 30px;
        text-align: center;
        color: #333;
        font-weight: bold;
    }

    .no-papers-message {
        text-align: center;
        font-size: 1.1rem;
        color: #666;
    }

    .user-papers-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 20px;
    }

    .paper-item-card {
        background-color: #f4f4f4;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        padding: 15px;
        display: flex;
        flex-direction: column;
        position: relative;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        height: 100%; /* Ensure card height stretches to fit content */
    }

    .paper-item-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
    }

    .paper-item-content {
        flex: 1; /* Allow this to expand and fill available space */
        display: flex;
        flex-direction: column;
        justify-content: space-between; /* Push button to the bottom */
    }

    .view-full-paper-btn {
        background-color: #007bff; /* Blue color for the button */
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        font-size: 1rem;
        font-weight: bold;
        cursor: pointer;
        margin-top: 20px; /* Adjusted to push button down */
        width: 100%;
        max-width: 200px; /* Adjust width as needed */
    }

    .view-full-paper-btn:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }


    .paper-item-name {
        font-size: 1.3rem;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px; /* Spacing below the paper name */
    }

    .paper-item-badges {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        gap: 10px;
        top: 0;
    }

    .badge-score, .badge-status {
        padding: 10px 20px;
        border-radius: 4px;
        color: #fff;
        font-size: 1rem;
        font-weight: bold;
        display: inline-block;
        text-align: center;
    }

    .badge-score {
        background-color: #1e90ff;
        width: 100%;
        max-width: 160px;
    }

    .badge-pass {
        background-color: #28a745;
        width: 100%;
        max-width: 160px;
    }

    .badge-fail {
        background-color: #dc3545;
        width: 100%;
        max-width: 160px;
    }

    /* Ensure there is a gap between question cards when visible */
    .question-card {
        margin-bottom: 20px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        transition: margin-top 0.3s ease;
    }

    /* Add a class to introduce a gap when a card is opened */
    .question-card.expanded {
        margin-top: 20px;
    }


    .custom-answer-list {
        display: flex;
        flex-direction: column;
    }

    .custom-answer-option {
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
        margin-bottom: 5px;
        width: 100%; /* Ensure full width */
    }

    .custom-answer-option.incorrect {
        background-color: #f8d7da;
    }

    .correct-answer-text {
        color: #28a745;
        font-weight: bold;
    }

    .user-wrong-answer {
        background-color: #f8d7da;
        padding: 10px;
        border-radius: 5px;
        margin-top: 10px;
        text-align: center;
    }

    .error-message {
        color: red;
    }

    .view-description-btn {
        background-color: #6c757d; /* Grey color for the button */
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        font-size: 1rem;
        font-weight: bold;
        cursor: pointer;
        margin-top: 10px;
    }

    .view-description-btn:hover {
        background-color: #5a6268; /* Darker grey on hover */
    }

    .answer-description {
        margin-top: 10px;
    }
    .user-wrong-answer {
        background-color: #f8d7da; /* Light red background */
        padding: 5px;
        border-radius: 5px;
        margin-top: 10px;
        text-align: center;
        color: #721c24; /* Darker red for text */
        font-weight: bold;
    }

    .incorrect-answer-text {
        font-size: 1rem;
        margin-top: 5px;
    }

    .error-message {
        color: #856404; /* Warning color */
        font-style: italic;
        margin-top: 10px;
    }


</style>
