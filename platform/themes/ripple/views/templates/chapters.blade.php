<!-- Chapters Section -->
<section class="chapters-section py-5">
    <div class="container">
        <h2 class="section-title">Explore the {{ $subject->name }} Papers Within Each Chapter</h2>
        <div class="chapters-grid">
            @if ($chapters->isEmpty())
                <p class="no-chapters-message">No chapters available for this subject.</p>
            @else
                @foreach ($chapters as $chapter)
                    <div class="chapter-card">
                        <a href="{{ route('quiz_paper', $chapter->id) }}" class="chapter-link">
                            <div class="chapter-icon"><i class="fas fa-book-open"></i></div>
                            <h3 class="chapter-title">{{ $chapter->name }}</h3>
                        </a>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
</section>


<!-- CSS Styling -->
<style>

    .section-title {
        text-align: center;
        font-size: 2em;
        color: #333;
        margin-bottom: 40px;
    }

    .chapters-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 40px;
        padding: 0 20px;
    }

    .chapter-card {
        background-color: #fff;
        border-radius: 6px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
        padding: 20px;
        transition: transform 0.3s, box-shadow 0.3s;
        cursor: pointer;
        border-left: 5px solid #007bff; /* Add left border */
    }

    .chapter-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    .chapter-icon {
        font-size: 2.5em;
        color: #007bff;
        margin-bottom: 10px;
    }

    .chapter-title {
        font-size: 1.2em;
        color: #333;
        font-weight: 400;
    }

    /* Responsive Styling */
    @media (max-width: 768px) {
        .chapters-grid {
            grid-template-columns: repeat(2, 1fr); /* 2 columns on smaller screens */
        }
    }

    @media (max-width: 576px) {
        .chapters-grid {
            grid-template-columns: 1fr; /* 1 column on extra small screens */
        }
        .section-title {
            font-size: 1.8em;
        }
        .chapter-card {
            padding: 15px;
        }
        .chapter-title {
            font-size: 1em;
        }
    }
</style>
