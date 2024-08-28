<section class="questions-section">
    <div class="containers">

        <!-- Timer Display -->
        <div class="timer-container">
            <div class="timer-text">
                Exam Finish in: <span id="paperTimer">00:00:00</span>
            </div>
            <div class="timer-text">
                Question Timer: <span id="questionTimer">00:15</span>
            </div>
        </div>

        <!-- Navigation Boxes -->
        <div class="question-navigation">
            @foreach ($questionsWithAnswers as $index => $question)
                <div class="question-nav-box" data-index="{{ $index }}">
                    {{ $index + 1 }}
                </div>
            @endforeach
        </div>

        <!-- Question Content -->
        <div class="question-content">
            <button class="reset-button" id="resetAnswerBtn">Reset</button>
            <button class="confirm-button" id="confirmAnswerBtn">Confirm answer</button>
            @foreach ($questionsWithAnswers as $index => $question)
                <div id="question-{{ $index }}" class="question-page {{ $index === 0 ? 'active' : '' }}">
                    <h4 class="question-text">Question {{ $index + 1 }}</h4>
                    <p class="question-description">{{ $question->question }}</p>

                    <!-- Display answers -->
                    <div class="answers-list">
                        @foreach ($question->answers as $answerIndex => $answer)
                            <div class="answer-option">
                                <span class="answer-number">a.</span>
                                <span class="answer-text">{{ $answer->answer_1 }}</span>
                                <input class="form-check-input" type="radio" name="question_{{ $index }}" value="answer_1" data-correct="{{ $answer->is_answer_1 ? 'true' : 'false' }}">
                            </div>
                            <div class="answer-option">
                                <span class="answer-number">b.</span>
                                <span class="answer-text">{{ $answer->answer_2 }}</span>
                                <input class="form-check-input" type="radio" name="question_{{ $index }}" value="answer_2" data-correct="{{ $answer->is_answer_2 ? 'true' : 'false' }}">
                            </div>
                            <div class="answer-option">
                                <span class="answer-number">c.</span>
                                <span class="answer-text">{{ $answer->answer_3 }}</span>
                                <input class="form-check-input" type="radio" name="question_{{ $index }}" value="answer_3" data-correct="{{ $answer->is_answer_3 ? 'true' : 'false' }}">
                            </div>
                            <div class="answer-option">
                                <span class="answer-number">d.</span>
                                <span class="answer-text">{{ $answer->answer_4 }}</span>
                                <input class="form-check-input" type="radio" name="question_{{ $index }}" value="answer_4" data-correct="{{ $answer->is_answer_4 ? 'true' : 'false' }}">
                            </div>
                        @endforeach
                    </div>
                </div>
            @endforeach
        </div>


        <!-- Navigation Buttons -->
        <div class="button-question">
            <button id="previousQuestionBtn" class="question-button" disabled>Previous</button>
            <button id="nextQuestionBtn" class="question-button" disabled>Next</button>
            <button id="quitButton" class="quit-button" data-paper-id="{{ $paper->id }}">Quit</button>

        </div>
    </div>
</section>

<!-- Modal Structure -->
<div id="myModal" class="custom-modal-overlay">
    <div class="custom-modal-content">
        <span class="custom-modal-close"></span>
        <h2>Are you sure you want to quit the paper?</h2>
        <p>Click "Yes" to return to the instructions or "No" to stay on the current page.</p>
        <div class="custom-modal-button-container">
            <button id="yesButton" class="custom-modal-yes-button">Yes</button>
            <button id="noButton" class="custom-modal-no-button">No</button>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        let currentIndex = 0;
        const questions = document.querySelectorAll('.question-page');
        const navBoxes = document.querySelectorAll('.question-nav-box');
        const modal = document.getElementById('myModal');
        const openModalButton = document.getElementById('quitButton');
        const closeModalSpan = document.querySelector('.custom-modal-close');
        const yesButton = document.getElementById('yesButton');
        const noButton = document.getElementById('noButton');
        const confirmButton = document.getElementById('confirmAnswerBtn');
        const resetButton = document.getElementById('resetAnswerBtn');
        const radios = document.querySelectorAll('.form-check-input');
        const totalQuestions = questions.length;
        let questionTimers = Array(totalQuestions).fill(15);
        let questionCompleted = Array(totalQuestions).fill(false);
        let paperTimer = {{$paper->time}} * 60;
        const paperId = {{$paper->id}};
        const marksPerQuestion = {{$paper->marks_per_question}};
        let paperTimerInterval, questionTimerIntervals = [];

        function disableSection() {
            document.querySelector('.questions-section').style.pointerEvents = 'none';
            document.querySelector('.questions-section').style.opacity = '0.5';
        }

        function stopAllTimers() {
            clearInterval(paperTimerInterval);
            questionTimerIntervals.forEach(interval => clearInterval(interval));
        }

        function handleExamEnd() {
            stopAllTimers();
            disableSection();
            calculateAndDisplayScore();
        }

        function loadState() {
            const savedIndex = localStorage.getItem('currentIndex');
            const savedPaperTimer = localStorage.getItem('paperTimer');
            const savedQuestionTimers = localStorage.getItem('questionTimers');
            const savedQuestionCompleted = localStorage.getItem('questionCompleted');

            if (savedIndex !== null) currentIndex = parseInt(savedIndex);
            if (savedPaperTimer !== null) paperTimer = parseInt(savedPaperTimer);
            if (savedQuestionTimers !== null) questionTimers = JSON.parse(savedQuestionTimers);
            if (savedQuestionCompleted !== null) questionCompleted = JSON.parse(savedQuestionCompleted);
        }

        function saveState() {
            localStorage.setItem('currentIndex', currentIndex);
            localStorage.setItem('paperTimer', paperTimer);
            localStorage.setItem('questionTimers', JSON.stringify(questionTimers));
            localStorage.setItem('questionCompleted', JSON.stringify(questionCompleted));
        }

        function startPaperTimer() {
            paperTimerInterval = setInterval(function() {
                if (paperTimer <= 0) {
                    handleExamEnd();
                } else {
                    paperTimer--;
                    updatePaperTimerDisplay();
                    saveState();
                }
            }, 1000);
        }

        function updatePaperTimerDisplay() {
            const hours = Math.floor(paperTimer / 3600);
            const minutes = Math.floor((paperTimer % 3600) / 60);
            const seconds = paperTimer % 60;
            document.getElementById('paperTimer').textContent =
                `${hours < 10 ? '0' : ''}${hours}:${minutes < 10 ? '0' : ''}${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
        }

        function showQuestion(index) {
            questions.forEach(question => question.classList.remove('active'));
            navBoxes.forEach(box => box.classList.remove('active'));
            questions[index].classList.add('active');
            navBoxes[index].classList.add('active');

            if (!questionCompleted[index]) {
                document.getElementById('nextQuestionBtn').disabled = true;
                startQuestionTimer(index);
            } else {
                document.getElementById('nextQuestionBtn').disabled = false;
            }

            document.getElementById('previousQuestionBtn').disabled = index === 0;

            if (index === totalQuestions - 1) {
                document.getElementById('nextQuestionBtn').textContent = 'Finish Exam';
            } else {
                document.getElementById('nextQuestionBtn').textContent = 'Next Question';
            }
        }

        function startQuestionTimer(index) {
            let timer = questionTimers[index];
            document.getElementById('questionTimer').textContent = `00:${timer < 10 ? '0' : ''}${timer}`;

            const interval = setInterval(function() {
                if (timer <= 0) {
                    clearInterval(interval);
                    questionCompleted[index] = true;
                    document.getElementById('questionTimer').textContent = "00:00";
                    document.getElementById('nextQuestionBtn').disabled = false;
                } else {
                    timer--;
                    questionTimers[index] = timer;
                    document.getElementById('questionTimer').textContent = `00:${timer < 10 ? '0' : ''}${timer}`;
                    saveState();
                }
            }, 1000);

            questionTimerIntervals[index] = interval;
        }

        function calculateAndDisplayScore() {
            let score = 0;

            questions.forEach((question, index) => {
                const selectedAnswer = question.querySelector('input[type="radio"]:checked');
                const correctAnswer = question.querySelector('input[data-correct="true"]');

                if (selectedAnswer && correctAnswer && selectedAnswer.value === correctAnswer.value) {
                    score += marksPerQuestion;
                }
            });

            // Redirect to instruction page with the score
            window.location.href = `/paper/${paperId}/instruction?score=${score}`;
        }

        confirmButton.disabled = true;
        radios.forEach(radio => {
            radio.addEventListener('change', function() {
                confirmButton.disabled = false;
            });
        });

        confirmButton.addEventListener('click', function() {
            const currentNavBox = document.querySelector('.question-nav-box.active');
            if (currentNavBox) {
                currentNavBox.style.backgroundColor = 'green';
            }
            questionCompleted[currentIndex] = true;
            confirmButton.disabled = true;
        });

        resetButton.addEventListener('click', function() {
            const currentIndex = Array.from(questions).findIndex(question => question.classList.contains('active'));
            const radios = questions[currentIndex].querySelectorAll('.form-check-input');

            radios.forEach(radio => {
                radio.checked = false;
            });

            const currentNavBox = navBoxes[currentIndex];
            if (currentNavBox) {
                currentNavBox.style.backgroundColor = '';
            }

            confirmButton.disabled = true;
        });

        navBoxes.forEach((navBox, index) => {
            navBox.addEventListener('click', function() {
                document.querySelector('.question-nav-box.active').classList.remove('active');
                navBox.classList.add('active');
            });
        });

        document.getElementById('nextQuestionBtn').addEventListener('click', function() {
            if (currentIndex < totalQuestions - 1) {
                currentIndex++;
                showQuestion(currentIndex);
            } else {
                handleExamEnd();
            }
            saveState();
        });

        document.getElementById('previousQuestionBtn').addEventListener('click', function() {
            if (currentIndex > 0) {
                currentIndex--;
                showQuestion(currentIndex);
            }
            saveState();
        });

        openModalButton.onclick = function() {
            modal.style.display = 'block';
        }

        function closeModal() {
            modal.style.display = 'none';
        }

        closeModalSpan.onclick = closeModal;
        noButton.onclick = closeModal;

        yesButton.onclick = function() {
            handleExamEnd();
            closeModal();
        }

        window.onclick = function(event) {
            if (event.target === modal) {
                closeModal();
            }
        }

        loadState();
        showQuestion(currentIndex);
        startPaperTimer();
    });


</script>

<style>
    .questions-section {
        padding: 40px 15px;
        position: relative;
        background-color: #f9f9f9;
        box-sizing: border-box;
    }
    .quit-button {
        background-color: #dc3545; /* Red color */
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    .quit-button:hover {
        background-color: #c82333; /* Darker red on hover */
    }
    /* Modal styles */
    .custom-modal-overlay {
        display: none; /* Hidden by default */
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.5); /* Black background with opacity */
        padding-top: 60px;
    }

    .custom-modal-content {
        width: 35%; /* Set width to half of the screen */
        height: 50%; /* Set height to double */
        max-height: 50%; /* Ensure the height is responsive */
        margin: auto;
        padding: 20px;
        background-color: white;
        border-radius: 5px;
        position: relative;
    }

    .custom-modal-close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .custom-modal-close:hover,
    .custom-modal-close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    .custom-modal-button-container {
        position: absolute;
        bottom: 20px;
        right: 20px;
    }

    /* Yes and No Button styles */
    .custom-modal-yes-button {
        background-color: #dc3545; /* Red color */
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 10px; /* Space between buttons */
    }

    .custom-modal-yes-button:hover {
        background-color: #c82333; /* Darker red on hover */
    }

    .custom-modal-no-button {
        background-color: #007bff; /* Blue color */
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    /* Align buttons at bottom right */
    .custom-modal-button-container {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
    }

    .custom-modal-no-button:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }


    .checkboxes label {
        margin-right: 10px;
        font-size: 1rem;
        color: #333;
    }

    .action-buttons {
        display: flex;
        gap: 10px;
    }

    .reset-button {
        background-color: red;
        color: white;
        padding: 8px 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        float: right;
    }

    .confirm-button {
        background-color: green;
        color: white;
        padding: 8px 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        float: right;
        margin-right: 10px; /* Space between buttons */
    }

    .timer-container {
        position: absolute;
        top: 20px;
        right: 10px;
        text-align: right;
    }

    .timer-text {
        font-size: 1rem;
        font-weight: bold;
        color: #333;
        background-color: #fff;
        padding: 10px 15px;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 10px;
        display: inline-block;
    }

    .question-navigation {
        text-align: center;
        margin: 80px auto 30px;
        max-width: 600px;
    }

    .question-nav-box {
        display: inline-block;
        width: 36px;
        height: 36px;
        line-height: 36px;
        text-align: center;
        margin: 6px;
        background-color: #e0e0e0;
        border-radius: 50%;
        color: #333;
        font-size: 1rem;
        transition: background-color 0.3s, transform 0.3s;
        cursor: pointer;
    }

    .question-nav-box:hover {
        background-color: #b0bec5;
        transform: scale(1.1);
    }

    .question-nav-box.active {
        background-color: #007bff;
        color: #fff;
    }

    .question-content {
        text-align: left;
        margin: 0 auto;
        max-width: 800px;
        padding: 20px;
        position: relative;
    }

    .question-page {
        display: none;
    }

    .question-page.active {
        display: block;
    }

    .question-text {
        font-size: 1.8rem;
        margin-bottom: 15px;
        color: #333;
    }

    .question-description {
        font-size: 1.4rem;
        color: #666;
        margin-bottom: 20px;
    }

    .answers-list {
        margin-top: 20px;
    }

    .answer-option {
        font-size: 1.2rem;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        padding: 15px;
        border-radius: 8px;
        margin-bottom: 10px;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        display: flex;
        align-items: center;
    }

    .answer-number {
        font-weight: bold;
        margin-right: 10px;
    }

    .answer-text {
        flex: 1;
    }

    .form-check-input {
        margin-left: 10px;
        cursor: pointer;
        transform: scale(1.2); /* Make checkboxes more visible */
        border: 2px solid #007bff; /* Blue border */
        border-radius: 4px; /* Optional: adjust border radius for better visibility */
    }

    .button-question {
        margin-top: 40px;
        text-align: center;
    }

    .question-button {
        background-color: #007bff;
        border-color: #007bff;
        padding: 14px 28px;
        font-size: 1.1rem;
        color: #fff;
        border: none;
        border-radius: 8px;
        margin: 0 10px;
        cursor: pointer;
        opacity: 0.9;
        transition: opacity 0.3s, transform 0.3s;
    }

    .question-button:hover {
        opacity: 1;
        transform: scale(1.05);
    }

    .question-button:disabled {
        cursor: not-allowed;
        opacity: 0.5;
    }
    .question-nav-box.completed {
        background-color: green;
    }

    @media (max-width: 768px) {
        .questions-section {
            padding: 30px 10px;
        }

        .timer-text {
            font-size: 0.9rem;
            padding: 8px 12px;
        }

        .question-text {
            font-size: 1.5rem;
        }

        .question-nav-box {
            width: 30px;
            height: 30px;
            line-height: 30px;
            font-size: 0.9rem;
        }

        .answer-option {
            font-size: 1.2rem;
            padding: 12px;
        }

        .button-question {
            margin-top: 25px;
        }
    }

    @media (max-width: 576px) {
        .questions-section {
            padding: 20px 10px;
        }

        .timer-text {
            font-size: 0.8rem;
            padding: 6px 10px;
        }

        .question-text {
            font-size: 1.3rem;
        }

        .question-nav-box {
            width: 28px;
            height: 28px;
            line-height: 28px;
            font-size: 0.8rem;
        }

        .answer-option {
            font-size: 1.1rem;
            padding: 10px;
        }

        .button-question {
            margin-top: 15px;
        }
    }
</style>


