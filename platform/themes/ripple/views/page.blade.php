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
        <img src="{{ RvMedia::getImageUrl(theme_option('hero_image')) }}" alt="Hero Image">
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
                        <div class="col-md-4 col-sm-6 mb-4">
                            <a href="{{ route('subject_list', ['subject_id' => $subject->id]) }}">
                                <div class="subject-card p-4 h-100 d-flex align-items-center">
                                    <i class="fas fa-book subject-icon"></i>
                                    <h3 class="subject-title ms-3">{{ $subject->name }}</h3>
                                </div>
                            </a>
                        </div>

                    @endforeach
                @endif
            </div>

        </div>
    </section>

    {{--Subject Section End--}}

@endif
