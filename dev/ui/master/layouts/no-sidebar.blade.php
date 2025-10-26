{!! Theme::partial('header') !!}
@if (Theme::get('section-name'))
    {!! Theme::partial('breadcrumbs') !!}
@endif
<div class="container">
{!! Theme::content() !!}
</div>
{!! Theme::partial('footer') !!}
