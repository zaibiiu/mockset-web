@php
    Theme::set('section-name', $post->name);
    $post->loadMissing('metadata');

    if ($bannerImage = $post->getMetaData('banner_image', true)) {
        Theme::set('breadcrumbBannerImage', RvMedia::getImageUrl($bannerImage));
    }
@endphp

<article class="post post--single">
    <header class="post__header">
        <h1 class="post__title">{{ $post->name }}</h1>
        <div class="post__meta">
            {!! Theme::partial('blog.post-meta', compact('post')) !!}

            @if ($post->tags->isNotEmpty())
                @php
                    if (is_plugin_active('language') && is_plugin_active('language-advanced')) {
                        $post->tags->loadMissing('translations');
                    }
                @endphp
                <span class="post__tags">
                    {!! BaseHelper::renderIcon('ti ti-tags') !!}
                    @foreach ($post->tags as $tag)
                        <a href="{{ $tag->url }}" class="me-0">{{ $tag->name }}</a>@if (!$loop->last), @endif
                    @endforeach
                </span>
            @endif
        </div>
    </header>
    <div class="post__content">
        @if (defined('GALLERY_MODULE_SCREEN_NAME') && !empty($galleries = gallery_meta_data($post)))
            {!! render_object_gallery($galleries, ($post->first_category ? $post->first_category->name : __('Uncategorized'))) !!}
        @endif
        <div class="ck-content">{!! BaseHelper::clean($post->content) !!}</div>

        <br>
        <section class="new-item-shar">
            <span>{{ __('Share:') }}</span>

            {!! Theme::renderSocialSharing($post->url, SeoHelper::getDescription(), $post->image) !!}
        </section>
        <br>
    </div>
    @php $relatedPosts = get_related_posts($post->id, 2); @endphp

    @if ($relatedPosts->isNotEmpty())
        <footer class="post__footer">
            <div class="row">
                @foreach ($relatedPosts as $relatedItem)
                    <div class="col-md-6 col-sm-6 col-12">
                        <div class="post__relate-group @if ($loop->last) post__relate-group--right text-end @else text-start @endif">
                            <h4 class="relate__title">@if ($loop->first) {{ __('Previous Post') }} @else {{ __('Next Post') }} @endif</h4>
                            <article class="post post--related">
                                <div class="post__thumbnail"><a href="{{ $relatedItem->url }}" title="{{ $relatedItem->name }}" class="post__overlay"></a>
                                    {{ RvMedia::image($relatedItem->image, $relatedItem->name, 'thumb') }}
                                </div>
                                <header class="post__header">
                                    <p><a href="{{ $relatedItem->url }}" class="post__title"> {{ $relatedItem->name }}</a></p>
                                    <div class="post__meta"><span class="post__created-at">{{ Theme::formatDate($post->created_at) }}</span></div>
                                </header>
                            </article>
                        </div>
                    </div>
                @endforeach
            </div>
        </footer>
    @endif
    <br>
    {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, null, $post) !!}
</article>
