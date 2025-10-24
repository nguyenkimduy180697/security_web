<?php

namespace Dev\RequestQuote\Forms\Settings;

use Dev\Base\Forms\FieldOptions\CoreIconFieldOption;
use Dev\Base\Forms\FieldOptions\EditorFieldOption;
use Dev\Base\Forms\FieldOptions\OnOffFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\CoreIconField;
use Dev\Base\Forms\Fields\EditorField;
use Dev\Base\Forms\Fields\OnOffField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Setting\Forms\SettingForm;
use Dev\RequestQuote\Http\Requests\Settings\RequestQuoteSettingRequest;

class RequestQuoteSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/request-quote::request-quote.setting_title'))
            ->setSectionDescription(trans('plugins/request-quote::request-quote.settings.description'))
            ->setValidatorClass(RequestQuoteSettingRequest::class)
            ->add(
                'request_quote_enabled',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.enable_request_quote'))
                    ->value(setting('request_quote_enabled', true))
                    ->helperText(trans('plugins/request-quote::request-quote.enable_request_quote_helper'))
            )
            ->add(
                'request_quote_receiver_emails',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.receiver_emails'))
                    ->value(setting('request_quote_receiver_emails', ''))
                    ->placeholder(trans('plugins/request-quote::request-quote.receiver_emails_placeholder'))
                    ->helperText(trans('plugins/request-quote::request-quote.receiver_emails_helper'))
            )
            ->add(
                'request_quote_button_icon',
                CoreIconField::class,
                CoreIconFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.button_icon'))
                    ->value(setting('request_quote_button_icon', 'ti ti-file-text'))
                    ->helperText(trans('plugins/request-quote::request-quote.button_icon_helper'))
            )
            ->add(
                'request_quote_show_for_out_of_stock',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.show_for_out_of_stock'))
                    ->value(setting('request_quote_show_for_out_of_stock', false))
                    ->helperText(trans('plugins/request-quote::request-quote.show_for_out_of_stock_helper'))
            )
            ->add(
                'request_quote_show_always',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.show_always'))
                    ->value(setting('request_quote_show_always', true))
                    ->helperText(trans('plugins/request-quote::request-quote.show_always_helper'))
            )
            ->add(
                'request_quote_send_confirmation',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.send_confirmation_email'))
                    ->value(setting('request_quote_send_confirmation', true))
                    ->helperText(trans('plugins/request-quote::request-quote.send_confirmation_email_helper'))
            )
            ->add(
                'request_quote_button_radius',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.button_radius'))
                    ->value(setting('request_quote_button_radius', 4))
                    ->helperText(trans('plugins/request-quote::request-quote.button_radius_helper'))
            )
            ->add(
                'request_quote_show_form_info',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.show_form_info'))
                    ->value(setting('request_quote_show_form_info', false))
                    ->helperText(trans('plugins/request-quote::request-quote.show_form_info_helper'))
            )
            ->add(
                'request_quote_form_info_content',
                EditorField::class,
                EditorFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.form_info_content'))
                    ->value(setting('request_quote_form_info_content', ''))
                    ->placeholder(trans('plugins/request-quote::request-quote.form_info_content_placeholder'))
                    ->helperText(trans('plugins/request-quote::request-quote.form_info_content_helper'))
                    ->maxLength(2000)
            );
    }
}
