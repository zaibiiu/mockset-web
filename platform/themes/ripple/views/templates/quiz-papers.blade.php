<div class="row">
    <div class="col-lg-9 col-12" id="quiz-papers" class="paper-section" style="display: block;">
        <h2 class="section-title">{{ $chapter->name }} Papers</h2>
        @foreach ($papers as $paper)
            @if ($paper->paper_type == \Botble\QuizManager\Enums\PaperTypeEnum::QUIZ)
                <div class="col-12 mb-4">
                    <div class="paper-card">
                        <div class="paper-card-icon">
                            <i class="fas fa-question-circle paper-icon"></i>
                        </div>
                        <div class="paper-card-content">
                            <h3 class="paper-title">{{ $paper->name }}</h3>
                            <p style="font-size: 16px; color: grey; font-weight: 500;">{{ $paper->description }}</p>
                            <div class="paper-details">
                                <div class="paper-detail-item">
                                    <i class="fas fa-question-circle"></i> {{ $paper->question_count }} questions
                                </div>
                                <div class="paper-detail-item">
                                    <i class="fas fa-award"></i> {{ $paper->question_count * $paper->marks_per_question }} marks
                                </div>
                            </div>
                        </div>
                        <a class="start-test-btn"
                           href = "{{route('quiz_list', ['paper_id' => $paper->id]) }}">
                            Start Test
                        </a>
                    </div>
                </div>
            @endif
        @endforeach
    </div>

</div>
