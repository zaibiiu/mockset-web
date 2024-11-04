@if (!BaseHelper::isHomepage($page->id))
    @php
        Theme::set('section-name', SeoHelper::getTitle());
        $page->loadMissing('metadata');

        $bannerImage = $page->getMetaData('banner_image', true);

        if ($bannerImage) {
            Theme::set('breadcrumbBannerImage', RvMedia::getImageUrl($bannerImage));
        }

    @endphp
    <article class="post post--single">
        <div class="post__content">
            @if (defined('GALLERY_MODULE_SCREEN_NAME') && !empty($galleries = gallery_meta_data($page)))
                {!! render_object_gallery($galleries) !!}
            @endif
            {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, Html::tag('div', BaseHelper::clean($page->content), ['class' => 'ck-content'])->toHtml(), $page) !!}
        </div>
    </article>
@else
    {{--Hero Image Section Start--}}

    <section class="mockset-hero position-relative overflow-hidden z-1">
        <div class="hero-content">
            <div class="text-container">
                <h1>Crack your aviation exams with confidence. Our comprehensive mock tests cover all essential topics and question types.</h1>
            </div>

            <div class="image-container">
                <img src="{{ RvMedia::getImageUrl(theme_option('hero_image')) }}" alt="Hero Image">
            </div>
        </div>
    </section>

    {{--Hero Image Section End--}}

    {{--Subject Section Start--}}

    <section class="subjects-section py-5">
        <div class="container">
            <div class="row mb-4">
                <div class="col-12">
                    <h2 class="section-title text-left">Our Top Subjects</h2>
                </div>
            </div>
            @php
                $subjects = get_all_subjects();
            @endphp
            <div class="row">
                @if($subjects->isEmpty())
                    <div class="col-12">
                        <p>No subjects available at the moment.</p>
                    </div>
                @else
                    @foreach ($subjects as $subject)
                        <div class="col-md-4 col-sm-6 mb-4 col-12">
                            <div class="subject-card p-4 h-100 d-flex align-items-center"
                                 data-subject-id="{{ $subject->id }}">
                                <i class="fas fa-book subject-icon"></i>
                                <h3 class="subject-title ms-3">{{ $subject->name }}</h3>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </section>

    {{--Subject Section End--}}

    <!-- Modal Structure -->
    <div id="subjectModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Choose Your Action</h2>
            <div class="modal-buttons">
                <a href="#" id="navigateMocktest" class="btn-option">
                    Navigate to Mocktest Papers
                    <i class="fas fa-arrow-right button-icon"></i>
                </a>
                <a href="#" id="navigateQuiz" class="btn-option">
                    Navigate to Quiz Papers
                    <i class="fas fa-arrow-right button-icon"></i>
                </a>
            </div>
        </div>
    </div>



@endif

<style>
    /* Modal Styling */
    .modal {
        display: none; /* Hidden by default */
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.6);
    }

    .modal-content {
        background-color: #fff;
        margin: 10% auto;
        padding: 40px;
        border-radius: 8px;
        width: 90%;
        max-width: 450px;
        position: relative;
    }

    /* Close Button */
    .close {
        position: absolute;
        top: 15px;
        right: 20px;
        color: #555;
        font-size: 24px;
        font-weight: bold;
        cursor: pointer;
        transition: color 0.3s ease, transform 0.3s ease;
        z-index: 1000;
    }

    .close:hover {
        color: #000;
        transform: rotate(90deg); /* Rotate only the close icon */
        z-index: 1000;
    }

    /* Modal Title */
    .modal-content h2 {
        text-align: left;
        font-size: 20px;
        color: #333;
        margin-bottom: 40px;
    }

    /* Modal Buttons */
    .modal-buttons {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .btn-option {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 500;
        transition: background-color 0.3s;
    }

    .btn-option:hover {
        background-color: #0056b3;
    }

    .button-icon {
        font-size: 18px;
    }


    @media (max-width: 990px) {
        .section-title {
            text-align: center; /* Center align title on smaller screens */
        }

        .subject-card {
            width: 100%; /* Full width on smaller screens */
        }
    }
</style>

<script>
    // Get the modal and close elements
    var modal = document.getElementById("subjectModal");
    var closeBtn = document.getElementsByClassName("close")[0];

    // Show modal and set dynamic URLs when subject card is clicked
    document.querySelectorAll(".subject-card").forEach(card => {
        card.addEventListener("click", function(event) {
            event.preventDefault(); // Prevent any default link behavior

            var subjectId = this.getAttribute("data-subject-id");

            // Update the links for mocktest and quiz with the current subject ID
            document.getElementById("navigateMocktest").setAttribute("href", `/subject/${subjectId}/papers`);
            document.getElementById("navigateQuiz").setAttribute("href", `/subject/${subjectId}/chapters`);

            // Show the modal
            modal.style.display = "block";
        });
    });

    // Close the modal when clicking the close button
    closeBtn.onclick = function() {
        modal.style.display = "none";
    }

    // Close the modal when clicking outside the modal content
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

