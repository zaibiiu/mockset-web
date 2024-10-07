<style>
    :root {
        --color-1st: {{ theme_option('color', '#1E90FF') }} !important;
        --primary-color: {{ theme_option('color', '#1E90FF') }} !important;
    }
</style>


@php
    Theme::asset()->container('footer')->remove('simple-slider-js');
@endphp
