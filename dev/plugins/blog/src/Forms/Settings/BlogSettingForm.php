<?php

namespace Dev\Blog\Forms\Settings;

use Dev\Base\Forms\FieldOptions\OnOffFieldOption;
use Dev\Base\Forms\FieldOptions\SelectFieldOption;
use Dev\Base\Forms\Fields\OnOffCheckboxField;
use Dev\Base\Forms\Fields\SelectField;
use Dev\Blog\Http\Requests\Settings\BlogSettingRequest;
use Dev\Setting\Forms\SettingForm;

class BlogSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/blog::base.settings.title'))
            ->setSectionDescription(trans('plugins/blog::base.settings.description'))
            ->setValidatorClass(BlogSettingRequest::class)
            ->add(
                'blog_post_schema_enabled',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                ->label(trans('plugins/blog::base.settings.enable_blog_post_schema'))
                ->defaultValue($targetValue = ((bool) setting('blog_post_schema_enabled', true)))
                ->helperText(trans('plugins/blog::base.settings.enable_blog_post_schema_description'))
            )
            ->addOpenCollapsible('blog_post_schema_enabled', '1', $targetValue)
            ->add(
                'blog_post_schema_type',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/blog::base.settings.schema_type'))
                    ->choices([
                        'NewsArticle' => 'NewsArticle',
                        'News' => 'News',
                        'Article' => 'Article',
                        'BlogPosting' => 'BlogPosting',
                    ])
                    ->selected(setting('blog_post_schema_type', 'NewsArticle'))
            )
            ->addCloseCollapsible('blog_post_schema_enabled', '1');
    }
}
