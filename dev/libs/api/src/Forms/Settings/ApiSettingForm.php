<?php

namespace Dev\Api\Forms\Settings;

use Dev\Api\Facades\ApiHelper;
use Dev\Api\Http\Requests\ApiSettingRequest;
use Dev\Base\Forms\FieldOptions\AlertFieldOption;
use Dev\Base\Forms\FieldOptions\HtmlFieldOption;
use Dev\Base\Forms\FieldOptions\OnOffFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\AlertField;
use Dev\Base\Forms\Fields\HtmlField;
use Dev\Base\Forms\Fields\OnOffCheckboxField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Setting\Forms\SettingForm;

class ApiSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setValidatorClass(ApiSettingRequest::class)
            ->setSectionTitle(trans('libs/api::api.setting_title'))
            ->setSectionDescription(trans('libs/api::api.setting_description'))
            ->contentOnly()
            ->addGeneralSettings()
            ->addSecuritySettings()
            ->addPushNotificationSettings()
            ->addHelpSection();
    }

    protected function addGeneralSettings(): static
    {
        return $this
            ->addOpenFieldset('general', ['class' => 'form-fieldset'])
            ->add(
                'general_section_title',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('<h5 class="mb-3">' . trans('libs/api::api.api_general_section') . '</h5>')
            )
            ->add(
                'api_enabled',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('libs/api::api.api_enabled'))
                    ->helperText(trans('libs/api::api.api_enabled_description'))
                    ->value(ApiHelper::enabled())
                    ->toArray()
            )
            ->addCloseFieldset('general');
    }

    protected function addSecuritySettings(): static
    {
        $apiKey = ApiHelper::getApiKey();
        $hasApiKey = ! empty($apiKey);

        return $this
            ->addOpenFieldset('security', ['class' => 'form-fieldset mt-4'])
            ->add(
                'security_section_title',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('<h5 class="mb-3">' . trans('libs/api::api.api_security_section') . '</h5>')
            )
            ->when($hasApiKey, function ($form) {
                return $form->add(
                    'api_key_status',
                    AlertField::class,
                    AlertFieldOption::make()
                        ->type('success')
                        ->content('<strong>API Key Protection:</strong> Enabled. All API requests require the X-API-KEY header.')
                );
            })
            ->when(! $hasApiKey, function ($form) {
                return $form->add(
                    'api_key_status',
                    AlertField::class,
                    AlertFieldOption::make()
                        ->type('warning')
                        ->content('<strong>API Key Protection:</strong> Disabled. API endpoints are publicly accessible.')
                );
            })
            ->add(
                'api_key_wrapper',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content($this->getApiKeyFieldWithActions($apiKey))
            )
            ->addCloseFieldset('security');
    }

    protected function addPushNotificationSettings(): static
    {
        $fcmProjectId = setting('fcm_project_id');
        $fcmServiceAccountPath = setting('fcm_service_account_path');
        $hasFcmConfig = ! empty($fcmProjectId) && ! empty($fcmServiceAccountPath);

        return $this
            ->addOpenFieldset('push_notifications', ['class' => 'form-fieldset mt-4'])
            ->add(
                'push_notifications_section_title',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('<h5 class="mb-3">' . trans('libs/api::api.push_notifications_section') . '</h5>')
            )
            ->add(
                'push_notifications_enabled',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('libs/api::api.push_notifications_enabled'))
                    ->helperText(trans('libs/api::api.push_notifications_enabled_description'))
                    ->value(setting('push_notifications_enabled', false))
                    ->toArray()
            )
            ->add(
                'fcm_project_id',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('libs/api::api.fcm_project_id'))
                    ->helperText(trans('libs/api::api.fcm_project_id_description'))
                    ->placeholder(trans('libs/api::api.fcm_project_id_placeholder'))
                    ->value(setting('fcm_project_id'))
                    ->toArray()
            )
            ->add(
                'fcm_service_account_wrapper',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content($this->getFcmServiceAccountField($fcmServiceAccountPath))
            )
            ->when($hasFcmConfig, function ($form) {
                return $form->add(
                    'fcm_config_status',
                    AlertField::class,
                    AlertFieldOption::make()
                        ->type('success')
                        ->content('<strong>FCM Configuration:</strong> Project ID and service account are configured. Push notifications are ready to use.')
                );
            })
            ->when(! $hasFcmConfig, function ($form) {
                return $form->add(
                    'fcm_config_status',
                    AlertField::class,
                    AlertFieldOption::make()
                        ->type('warning')
                        ->content('<strong>FCM Configuration:</strong> Project ID or service account is not configured. Push notifications will not work.')
                );
            })
            ->add(
                'fcm_setup_instructions',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content($this->getFcmSetupInstructions())
            )
            ->add(
                'send_test_notification_wrapper',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content($this->getSendNotificationForm())
            )
            ->addCloseFieldset('push_notifications');
    }

    protected function addHelpSection(): static
    {
        return $this
            ->addOpenFieldset('help', ['class' => 'form-fieldset mt-4'])
            ->add(
                'help_section_title',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('<h5 class="mb-3">' . trans('libs/api::api.api_help_section') . '</h5>')
            )
            ->add(
                'api_documentation_info',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content($this->getDocumentationSection())
            )
            ->add(
                'api_usage_examples',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content($this->getUsageExamples())
            )
            ->addCloseFieldset('help');
    }

    protected function getApiKeyActions(): string
    {
        return view('libs/api::settings.partials.api-key-actions')->render();
    }

    protected function getApiKeyFieldWithActions(?string $apiKey): string
    {
        return view('libs/api::settings.partials.api-key-field', compact('apiKey'))->render();
    }

    protected function getDocumentationSection(): string
    {
        return view('libs/api::settings.partials.documentation-section')->render();
    }

    protected function getUsageExamples(): string
    {
        return view('libs/api::settings.partials.usage-examples')->render();
    }

    protected function getFcmServiceAccountField(?string $fcmServiceAccountPath): string
    {
        return view('libs/api::settings.partials.fcm-service-account-field', compact('fcmServiceAccountPath'))->render();
    }

    protected function getFcmSetupInstructions(): string
    {
        return view('libs/api::settings.partials.fcm-setup-instructions')->render();
    }

    protected function getSendNotificationForm(): string
    {
        return view('libs/api::settings.partials.send-notification-form')->render();
    }
}
