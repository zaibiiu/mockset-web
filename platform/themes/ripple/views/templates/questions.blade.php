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
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const csrfToken = '{{ csrf_token() }}';
        let currentIndex = 0;
        let attemptedCount = 0;
        let notAttemptedCount = 0;
        let currentZoom = 1;
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
        let questionConfirmed = Array(totalQuestions).fill(false);
        const attemptedCountElement = document.getElementById('attemptedCount');
        const notAttemptedCountElement = document.getElementById('notAttemptedCount');
        const questionContent = document.querySelector('.main-content');

        function disableSection() {
            document.querySelector('.questions-section').style.pointerEvents = 'none';
            document.querySelector('.questions-section').style.opacity = '0.5';
        }

        function stopAllTimers() {
            clearInterval(paperTimerInterval);
            questionTimerIntervals.forEach(interval => clearInterval(interval));
        }

        document.getElementById('zoomInBtn').addEventListener('click', function() {
            currentZoom += 0.1;
            questionContent.style.transform = `scale(${currentZoom})`;
        });

        document.getElementById('zoomOutBtn').addEventListener('click', function() {
            if (currentZoom > 0.5) {
                currentZoom -= 0.1;
                questionContent.style.transform = `scale(${currentZoom})`;
            }
        });

        function updateAttemptCounts() {
            notAttemptedCount = totalQuestions - attemptedCount;
            attemptedCountElement.textContent = attemptedCount;
            notAttemptedCountElement.textContent = Math.max(notAttemptedCount, 0);
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
            questions.forEach((question, i) => {
                question.classList.remove('active');
                const box = navBoxes[i];

                if (i === index) {
                    box.classList.add('active');
                    box.style.backgroundColor = questionConfirmed[i] ? 'green' : 'yellow'; // Set to yellow when active
                } else {
                    box.style.backgroundColor = questionConfirmed[i] ? 'green' : (questionCompleted[i] ? '#A0522D' : '#A0522D');
                }

                if (!questionConfirmed[i]) {
                    question.querySelectorAll('input[type="radio"]').forEach(radio => {
                        radio.checked = false;
                    });
                }

            });

            questions[index].classList.add('active');
            startQuestionTimer(index);

            document.getElementById('nextQuestionBtn').disabled = true;
            document.getElementById('previousQuestionBtn').disabled = index === 0;
            document.getElementById('nextQuestionBtn').textContent = (index === totalQuestions - 1) ? 'Finish Exam' : 'Next Question';
        }

        function startQuestionTimer(index) {
            let timer = questionTimers[index];
            document.getElementById('questionTimer').textContent = `00:${timer < 10 ? '0' : ''}${timer}`;

            const interval = setInterval(function () {
                if (timer <= 0) {
                    clearInterval(interval);
                    questionCompleted[index] = true;
                    document.getElementById('questionTimer').textContent = "00:00";

                    document.getElementById('nextQuestionBtn').disabled = false;

                    navBoxes.forEach(box => {
                        box.style.pointerEvents = 'auto';
                    });
                } else {
                    timer--;
                    questionTimers[index] = timer;
                    document.getElementById('questionTimer').textContent = `00:${timer < 10 ? '0' : ''}${timer}`;
                    saveState();
                }
            }, 1000);

            questionTimerIntervals[index] = interval;


            navBoxes.forEach(box => {
                box.style.pointerEvents = 'none';
            });
        }

        function calculateAndDisplayScore() {
            let score = 0;
            let wrongAnswers = [];

            questions.forEach((question, index) => {
                if (questionCompleted[index]) {
                    const selectedAnswer = question.querySelector('input[type="radio"]:checked');
                    const correctAnswer = question.querySelector('input[data-correct="true"]');

                    if (selectedAnswer && correctAnswer && selectedAnswer.value === correctAnswer.value) {
                        score += marksPerQuestion;
                    } else if (selectedAnswer) {
                        wrongAnswers.push({ questionIndex: index, selectedAnswer: selectedAnswer.value });
                    }

                }
            });

            fetch(`/paper/${paperId}/submit-score`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': csrfToken,
                },
                body: JSON.stringify({ score: score, wrongAnswers: wrongAnswers }),
            })
                .then(response => response.json())
                .then(data => {
                    console.log('Score and wrong answers submitted successfully:', data);
                })
                .catch(error => {
                    console.error('Error submitting score and wrong answers:', error);
                });

            const encodedWrongAnswers = encodeURIComponent(JSON.stringify(wrongAnswers));

            window.location.href = `/paper/${paperId}/instruction?score=${score}&wrongAnswers=${encodedWrongAnswers}`;

        }


        confirmButton.disabled = true;
        radios.forEach(radio => {
            radio.addEventListener('change', function() {
                confirmButton.disabled = false;
            });
        });

        confirmButton.addEventListener('click', function() {
            if (!questionCompleted[currentIndex]) {
                attemptedCount++;
                questionCompleted[currentIndex] = true;
            }

            questionConfirmed[currentIndex] = true;
            const currentNavBox = navBoxes[currentIndex];

            if (currentNavBox) {
                currentNavBox.style.backgroundColor = 'green';
            }

            updateAttemptCounts();
            confirmButton.disabled = true;
            saveState();
        });

        resetButton.addEventListener('click', function() {
            if (questionCompleted[currentIndex]) {
                attemptedCount--;
                questionCompleted[currentIndex] = false;
                questionConfirmed[currentIndex] = false;
                const currentNavBox = navBoxes[currentIndex];
                if (currentNavBox) {
                    currentNavBox.style.backgroundColor = 'yellow';
                }
                updateAttemptCounts();
            }

            questions[currentIndex].querySelectorAll('.form-check-input').forEach(radio => {
                radio.checked = false;
            });

            confirmButton.disabled = true;
            saveState();
        });

        navBoxes.forEach((box, index) => {
            box.addEventListener('click', function() {
                currentIndex = index;

                if (questionConfirmed[index]) {
                    box.style.backgroundColor = 'green'; n
                } else if (questionCompleted[index]) {
                    box.style.backgroundColor = '#A0522D';
                } else {
                    box.style.backgroundColor = 'yellow';
                }

                showQuestion(currentIndex);
                saveState();
            });
        });

        document.getElementById('nextQuestionBtn').addEventListener('click', function() {
            if (currentIndex < totalQuestions - 1) {
                if (!questionConfirmed[currentIndex]) {
                    const currentNavBox = navBoxes[currentIndex];
                    if (currentNavBox) {
                        currentNavBox.style.backgroundColor = '#A0522D';
                    }
                    notAttemptedCount++;
                    updateAttemptCounts();
                }
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
<section class="questions-section">
    <div class="containers">

        <div class="top-question-section">
            <div class="attempts-container">
                <div class="attempt-status">
                    <div class="rectangle" id="attemptedCount">0</div>
                    <div class="status-text">Attempt</div>
                </div>
                <div class="attempt-status">
                    <div class="rectangle" id="notAttemptedCount">0</div>
                    <div class="status-text">Not Attempt</div>
                </div>
            </div>

            <div class="status-box-container">
                <div class="status-box-wrapper">
                    <div class="status-box" style="background-color: yellow;"></div>
                    <span class="status-box-label">Current</span>
                </div>
                <div class="status-box-wrapper">
                    <div class="status-box" style="background-color: #A0522D;"></div>
                    <span class="status-box-label">Not Attempted</span>
                </div>
                <div class="status-box-wrapper">
                    <div class="status-box" style="background-color: green;"></div>
                    <span class="status-box-label">Attempted</span>
                </div>
            </div>

            <div class="question-info">
                <p class="marks">Marks: {{ $paper->marks_per_question }}</p>
            </div>

            <div class="timer-question">
                <div class="timer-text">
                    Exam Finish in: <span id="paperTimer">00:00:00</span>
                </div>
                <div class="timer-text">
                    Question Timer: <span id="questionTimer">00:15</span>
                </div>
            </div>
        </div>

        <div class="line"></div>

        <div class="question-navigation">
            @foreach ($questionsWithAnswers as $index => $question)
                <div class="question-nav-box" style="color: white; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.7); font-weight: bold" data-index="{{ $index }}">
                    {{ $index + 1 }}
                </div>
            @endforeach
        </div>

        <div class="line"></div>

        <div class="button-group">
            <button class="reset-button" id="resetAnswerBtn">Reset</button>
            <button class="confirm-button" id="confirmAnswerBtn">Confirm answer</button>
        </div>

        <!-- Question Content -->
        <div class="question-content">
                @foreach ($questionsWithAnswers as $index => $question)
                    <div id="question-{{ $index }}" class="question-page {{ $index === 0 ? 'active' : '' }}">
                        @foreach ($question->answers as $answerIndex => $answer)
                        <div class="answer-options-inline">
                            <h4 class="question-number-text">
                                <span class="question-number-icon">Q</span>
                                Question no: {{ $index + 1 }}
                            </h4>
                                <div class="answers-radio-options">
                                    <div class="answer-option-top">
                                        <span class="answer-number">a.</span>
                                        <input class="form-check-input" type="radio" name="question_{{ $index }}" value="answer_1" data-correct="{{ $answer->is_answer_1 ? 'true' : 'false' }}">
                                    </div>
                                    <div class="answer-option-top">
                                        <span class="answer-number">b.</span>
                                        <input class="form-check-input" type="radio" name="question_{{ $index }}" value="answer_2" data-correct="{{ $answer->is_answer_2 ? 'true' : 'false' }}">
                                    </div>
                                    <div class="answer-option-top">
                                        <span class="answer-number">c.</span>
                                        <input class="form-check-input" type="radio" name="question_{{ $index }}" value="answer_3" data-correct="{{ $answer->is_answer_3 ? 'true' : 'false' }}">
                                    </div>
                                    @if ($answer->answer_4)
                                        <div class="answer-option-top">
                                            <span class="answer-number">d.</span>
                                            <input class="form-check-input" type="radio" name="question_{{ $index }}" value="answer_4" data-correct="{{ $answer->is_answer_4 ? 'true' : 'false' }}">
                                        </div>
                                    @endif
                                </div>
                        </div>
                        <div class="line" ></div>

                        <div class="main-content">
                            <p class="question-description">{{ $question->question }}</p>

                            <!-- Display answers -->
                            <div class="answers-list">
                                    <div class="answer-option">
                                        <span class="answer-number">a.</span>
                                        <span class="answer-text">{{ $answer->answer_1 }}</span>
                                    </div>
                                    <div class="answer-option">
                                        <span class="answer-number">b.</span>
                                        <span class="answer-text">{{ $answer->answer_2 }}</span>
                                    </div>
                                    <div class="answer-option">
                                        <span class="answer-number">c.</span>
                                        <span class="answer-text">{{ $answer->answer_3 }}</span>
                                    </div>
                                    @if ($answer->answer_4)
                                        <div class="answer-option">
                                            <span class="answer-number">d.</span>
                                            <span class="answer-text">{{ $answer->answer_4 }}</span>
                                        </div>
                                    @endif
                            </div>
                        </div>
                      @endforeach
                    </div>
                @endforeach
        </div>

        <div class="line"></div>

        <div class="bottom-buttons">
            <div class="button-question">
                <button id="previousQuestionBtn" class="question-button" disabled>Previous</button>
                <button id="nextQuestionBtn" class="question-button" disabled>Next</button>
            </div>

            <div class="zoom-buttons">
                <button id="zoomInBtn" class="zoom-button">A++</button>
                <button id="zoomOutBtn" class="zoom-button">A--</button>
            </div>

            <div class="quit-papers">
                <button id="quitButton" class="quit-button" data-paper-id="{{ $paper->id }}">Quit</button>
            </div>
        </div>

    </div>
</section>

<div id="myModal" class="modal" style="z-index: 1000">
    <div class="custom-modal-content">
        <span class="custom-modal-close"></span>
        <h2>Are you sure you want to quit the paper?</h2>
        <p>Click "Yes" to return to the instructions or "No" to stay on the current page.</p>
        <div class="custom-modal-button-containers">
            <button id="yesButton" class="custom-modal-yes-button">Yes</button>
            <button id="noButton" class="custom-modal-no-button">No</button>
        </div>
    </div>
</div>

<style>

    .custom-modal-content {
        width: 35%;
        height: 40%;
        margin: auto;
        padding: 20px;
        background-color: white;
        border-radius: 5px;
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

    .custom-modal-yes-button {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 10px;
    }

    .custom-modal-yes-button:hover {
        background-color: #c82333;
    }

    .custom-modal-no-button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    .custom-modal-button-containers {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
    }

    .custom-modal-no-button:hover {
        background-color: #0056b3;
    }


    @media (max-width: 768px) {
        .custom-modal-content {
            width: 90%; /* Full width on small screens */
            height: auto; /* Adjust height */
            max-height: 80%; /* Limit maximum height */
            margin: 10% auto; /* Center the modal */
            padding: 15px; /* Adjust padding */
        }

        .custom-modal-button-containers {
            flex-direction: column; /* Stack buttons vertically */
            gap: 0;
            width: 40%;
            justify-content: flex-end;
        }

        .custom-modal-yes-button,
        .custom-modal-no-button {
            width: 100%; /* Full width buttons */
            margin: 5px 0; /* Space between buttons */
        }
    }

</style>
