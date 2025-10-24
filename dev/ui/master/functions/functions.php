<?php

use Dev\Base\Forms\FieldOptions\MediaImageFieldOption;
use Dev\Base\Forms\Fields\MediaImageField;
use Dev\Base\Forms\FormAbstract;
use Dev\Base\Rules\MediaImageRule;
use Dev\Blog\Models\Post;
use Dev\Media\Facades\AppMedia;
use Dev\Member\Forms\PostForm as MemberPostForm;
use Dev\Page\Models\Page;
use Dev\Theme\Facades\Theme;
use Dev\Theme\Supports\ThemeSupport;
use Dev\Theme\Typography\TypographyItem;
use Dev\Widget\Events\RenderingWidgetSettings;

app()->booted(function (): void {
    AppMedia::addSize('featured', 565, 375)
        ->addSize('medium', 540, 360)
        ->addSize('small', 375, 250);

    Theme::typography()
        ->registerFontFamilies([
            new TypographyItem('primary', __('Primary'), theme_option('primary_font', 'Roboto')),
        ])
        ->registerFontSizes([
            new TypographyItem('h1', __('Heading 1'), 28),
            new TypographyItem('h2', __('Heading 2'), 24),
            new TypographyItem('h3', __('Heading 3'), 22),
            new TypographyItem('h4', __('Heading 4'), 20),
            new TypographyItem('h5', __('Heading 5'), 18),
            new TypographyItem('h6', __('Heading 6'), 16),
            new TypographyItem('body', __('Body'), 14),
        ]);

    ThemeSupport::registerSocialLinks();
    ThemeSupport::registerToastNotification();
    ThemeSupport::registerPreloader();
    ThemeSupport::registerSiteCopyright();
    ThemeSupport::registerDateFormatOption();
    ThemeSupport::registerLazyLoadImages();
    ThemeSupport::registerSocialSharing();
    ThemeSupport::registerSiteLogoHeight();

    $events = app('events');

    $events->listen('core.page::registering-templates', function (): void {
        register_page_template([
            'no-sidebar' => __('No sidebar'),
        ]);
    });

    $events->listen([RenderingWidgetSettings::class, 'core.widget:rendering'], function (): void {
        register_sidebar([
            'id' => 'top_sidebar',
            'name' => __('Top sidebar'),
            'description' => __('Area for widgets on the top sidebar'),
        ]);

        register_sidebar([
            'id' => 'footer_sidebar',
            'name' => __('Footer sidebar'),
            'description' => __('Area for footer widgets'),
        ]);
    });

    FormAbstract::extend(function (FormAbstract $form): void {
        $model = $form->getModel();

        if (! $model instanceof Post && ! $model instanceof Page) {
            return;
        }

        $form
            ->addAfter(
                'image',
                'banner_image',
                MediaImageField::class,
                MediaImageFieldOption::make()->label(__('Banner image (1920x170px)'))->metadata()
            );
    }, 124);

    FormAbstract::afterSaving(function (FormAbstract $form): void {
        if (! $form instanceof MemberPostForm) {
            return;
        }

        $request = $form->getRequest();

        $request->validate([
            'banner_image_input' => ['nullable', new MediaImageRule()],
        ]);

        /**
         * @var Post $model
         */
        $model = $form->getModel();

        $model->saveMetaDataFromFormRequest('banner_image', $request);
    }, 175);
});
