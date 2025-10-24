<?php

namespace Dev\Theme\Forms\Settings;

use Dev\Base\Facades\BaseHelper;
use Dev\Base\Forms\FieldOptions\CodeEditorFieldOption;
use Dev\Base\Forms\FieldOptions\HtmlFieldOption;
use Dev\Base\Forms\FieldOptions\OnOffFieldOption;
use Dev\Base\Forms\FieldOptions\RadioFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\CodeEditorField;
use Dev\Base\Forms\Fields\HtmlField;
use Dev\Base\Forms\Fields\OnOffField;
use Dev\Base\Forms\Fields\RadioField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Setting\Forms\SettingForm;
use Dev\Theme\Http\Requests\WebsiteTrackingSettingRequest;

class WebsiteTrackingSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $googleTagManagerId = setting('google_tag_manager_id', setting('google_analytics'));
        $gtmContainerId = setting('gtm_container_id');
        $customTrackingHeaderJs = setting('custom_tracking_header_js');
        $customTrackingBodyHtml = setting('custom_tracking_body_html');

        $oldGoogleTagManagerCode = setting('google_tag_manager_code');

        if ($oldGoogleTagManagerCode && ! $customTrackingHeaderJs && ! $customTrackingBodyHtml) {
            $customTrackingHeaderJs = $oldGoogleTagManagerCode;
        }

        $defaultType = setting('google_tag_manager_type');
        if (! $defaultType) {
            if ($gtmContainerId) {
                $defaultType = 'gtm';
            } elseif ($oldGoogleTagManagerCode || $customTrackingHeaderJs || $customTrackingBodyHtml) {
                $defaultType = 'custom';
            } elseif ($googleTagManagerId) {
                $defaultType = 'id';
            } else {
                $defaultType = 'gtm';
            }
        } elseif ($defaultType === 'code') {
            $defaultType = 'custom';
        }

        $this
            ->setSectionTitle(trans('libs/theme::theme.settings.website_tracking.title'))
            ->setSectionDescription(trans('libs/theme::theme.settings.website_tracking.description'))
            ->setValidatorClass(WebsiteTrackingSettingRequest::class)
            ->add(
                'google_tag_manager_type',
                RadioField::class,
                RadioFieldOption::make()
                    ->choices([
                        'gtm' => trans('libs/theme::theme.settings.website_tracking.google_tag_manager'),
                        'id' => trans('libs/theme::theme.settings.website_tracking.google_tag_id'),
                        'custom' => trans('libs/theme::theme.settings.website_tracking.custom_tracking'),
                    ])
                    ->selected($targetValue = old('google_tag_manager_type', $defaultType))
            )
            ->addOpenCollapsible('google_tag_manager_type', 'gtm', $targetValue)
            ->add(
                'gtm_description',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('<div class="alert alert-success mb-3">' . BaseHelper::renderIcon('ti ti-info-circle') . ' ' . trans('libs/theme::theme.settings.website_tracking.google_tag_manager_description') . '</div>')
            )
            ->add(
                'gtm_setup_guide',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('libs/theme::partials.website-tracking.gtm-setup-guide')
            )
            ->add(
                'gtm_container_id',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('libs/theme::theme.settings.website_tracking.gtm_container_id'))
                    ->value($gtmContainerId)
                    ->placeholder(trans('libs/theme::theme.settings.website_tracking.gtm_container_id_placeholder'))
                    ->helperText(trans('libs/theme::theme.settings.website_tracking.gtm_container_id_helper'))
            )
            ->add(
                'gtm_debug_mode',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('libs/theme::theme.settings.website_tracking.gtm_debug_mode'))
                    ->value((bool) setting('gtm_debug_mode', false))
                    ->helperText(trans('libs/theme::theme.settings.website_tracking.gtm_debug_mode_helper'))
            )
            ->add(
                'gtm_add_ga4',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('libs/theme::partials.website-tracking.gtm-add-ga4-guide')
            )
            ->add(
                'gtm_verification',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('libs/theme::partials.website-tracking.gtm-verification-guide')
            )
            ->addCloseCollapsible('google_tag_manager_type', 'gtm')
            ->addOpenCollapsible('google_tag_manager_type', 'id', $targetValue)
            ->add(
                'id_description',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('<div class="alert alert-info mb-3">' . BaseHelper::renderIcon('ti ti-info-circle') . ' ' . trans('libs/theme::theme.settings.website_tracking.google_tag_id_description') . '</div>')
            )
            ->add(
                'ga_setup_guide',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('libs/theme::partials.website-tracking.ga-setup-guide')
            )
            ->add(
                'google_tag_manager_id',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('libs/theme::theme.settings.website_tracking.google_tag_id'))
                    ->value($googleTagManagerId)
                    ->placeholder(trans('libs/theme::theme.settings.website_tracking.google_tag_id_placeholder'))
                    ->helperText(trans('libs/theme::theme.settings.website_tracking.google_tag_id_helper'))
            )
            ->add(
                'ga_verification',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('libs/theme::partials.website-tracking.ga-verification-guide')
            )
            ->addCloseCollapsible('google_tag_manager_type', 'id')
            ->addOpenCollapsible('google_tag_manager_type', 'custom', $targetValue)
            ->add(
                'custom_description',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('<div class="alert alert-warning mb-3">' . BaseHelper::renderIcon('ti ti-info-circle') . ' ' . trans('libs/theme::theme.settings.website_tracking.custom_tracking_description') . '</div>')
            )
            ->add(
                'custom_setup_guide',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('libs/theme::partials.website-tracking.custom-setup-guide')
            )
            ->add(
                'custom_tracking_instruction',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('<div class="form-text mb-3">' . trans('libs/theme::theme.settings.website_tracking.custom_tracking_instruction') . '</div>')
            )
            ->add(
                'custom_tracking_header_js',
                CodeEditorField::class,
                CodeEditorFieldOption::make()
                    ->label(trans('libs/theme::theme.settings.website_tracking.custom_tracking_header_js'))
                    ->value($customTrackingHeaderJs)
                    ->mode('html')
                    ->helperText(trans('libs/theme::theme.settings.website_tracking.custom_tracking_header_js_helper'))
            )
            ->add(
                'custom_tracking_body_html',
                CodeEditorField::class,
                CodeEditorFieldOption::make()
                     ->label(trans('libs/theme::theme.settings.website_tracking.custom_tracking_body_html'))
                     ->value($customTrackingBodyHtml)
                     ->mode('html')
                     ->helperText(trans('libs/theme::theme.settings.website_tracking.custom_tracking_body_html_helper'))
            )
            ->add(
                'custom_verification',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('libs/theme::partials.website-tracking.custom-verification-guide')
            )
            ->addCloseCollapsible('google_tag_manager_type', 'custom');
    }
}
