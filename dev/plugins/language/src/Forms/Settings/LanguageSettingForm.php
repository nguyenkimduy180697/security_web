<?php

namespace Dev\Language\Forms\Settings;

use Dev\Base\Forms\FieldOptions\AlertFieldOption;
use Dev\Base\Forms\FieldOptions\HtmlFieldOption;
use Dev\Base\Forms\FieldOptions\MultiChecklistFieldOption;
use Dev\Base\Forms\FieldOptions\OnOffFieldOption;
use Dev\Base\Forms\FieldOptions\RadioFieldOption;
use Dev\Base\Forms\Fields\AlertField;
use Dev\Base\Forms\Fields\HtmlField;
use Dev\Base\Forms\Fields\MultiCheckListField;
use Dev\Base\Forms\Fields\OnOffCheckboxField;
use Dev\Base\Forms\Fields\RadioField;
use Dev\Base\Forms\FormAbstract;
use Dev\Language\Facades\Language;
use Dev\Language\Http\Requests\Settings\LanguageSettingRequest;
use Dev\Setting\Models\Setting;

class LanguageSettingForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Setting::class)
            ->setUrl(route('languages.settings'))
            ->setMethod('POST')
            ->setFormOption('class', 'language-settings-form')
            ->contentOnly()
            ->setValidatorClass(LanguageSettingRequest::class)
            ->add(
                'language_hide_default',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/language::language.language_hide_default'))
                    ->value(setting('language_hide_default', true))
            )
            ->add(
                'language_display',
                RadioField::class,
                RadioFieldOption::make()
                    ->label(trans('plugins/language::language.language_display'))
                    ->choices([
                        'all' => trans('plugins/language::language.language_display_all'),
                        'flag' => trans('plugins/language::language.language_display_flag_only'),
                        'name' => trans('plugins/language::language.language_display_name_only'),
                    ])
                    ->selected(setting('language_display', 'all'))
            )
            ->add(
                'language_switcher_display',
                RadioField::class,
                RadioFieldOption::make()
                    ->label(trans('plugins/language::language.switcher_display'))
                    ->choices([
                        'dropdown' => trans('plugins/language::language.language_switcher_display_dropdown'),
                        'list' => trans('plugins/language::language.language_switcher_display_list'),
                    ])
                    ->selected(setting('language_switcher_display', 'dropdown'))
            );

        if ($languageActives = Language::getActiveLanguage()) {
            $choices = [];
            foreach ($languageActives as $language) {
                if (! $language->lang_is_default) {
                    $choices[$language->lang_id] = $language->lang_name;
                }
            }

            if ($choices) {
                $this
                    ->add(
                        'language_hide_languages[]',
                        MultiCheckListField::class,
                        MultiChecklistFieldOption::make()
                            ->label(trans('plugins/language::language.hide_languages'))
                            ->choices($choices)
                            ->selected(json_decode(setting('language_hide_languages', '[]'), true))
                    );
            }
        }

        $this
            ->add(
                'hide_languages_helper_display_hidden',
                AlertField::class,
                AlertFieldOption::make()
                    ->content(
                        trans_choice(
                            'plugins/language::language.hide_languages_helper_display_hidden',
                            count(json_decode(setting('language_hide_languages', '[]'), true)),
                            ['language' => Language::getHiddenLanguageText()]
                        )
                    )
            )
            ->add(
                'language_auto_detect_user_language',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/language::language.language_auto_detect_user_language'))
                    ->helperText(trans('plugins/language::language.language_auto_detect_user_language_helper'))
                    ->value(setting('language_auto_detect_user_language', false))
            )
            ->add(
                'button_action',
                HtmlField::class,
                HtmlFieldOption::make()->view('plugins/language::forms.button-action')
            );
    }
}
