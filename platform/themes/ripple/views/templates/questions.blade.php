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
        const csrfToken = '{{ csrf_token() }}';
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
            let wrongAnswers = []; // Make sure wrongAnswers is defined here or globally if needed

            questions.forEach((question, index) => {
                const selectedAnswer = question.querySelector('input[type="radio"]:checked');
                const correctAnswer = question.querySelector('input[data-correct="true"]');

                if (selectedAnswer && correctAnswer && selectedAnswer.value === correctAnswer.value) {
                    score += marksPerQuestion;
                } else if (selectedAnswer) {
                    wrongAnswers.push({ questionIndex: index, selectedAnswer: selectedAnswer.value });
                }
            });

            // Submit the score and wrong answers via fetch
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


