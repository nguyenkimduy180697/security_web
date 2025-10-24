<?php

namespace Dev\Slug\Forms;

use Dev\Base\Forms\FieldOptions\HtmlFieldOption;
use Dev\Base\Forms\FieldOptions\OnOffFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\HtmlField;
use Dev\Base\Forms\Fields\OnOffField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Setting\Forms\SettingForm;
use Dev\Slug\Facades\SlugHelper;
use Dev\Slug\Http\Requests\SlugSettingsRequest;
use Illuminate\Support\Str;

class SlugSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $form = $this
            ->setSectionTitle(trans('libs/slug::slug.settings.title'))
            ->setSectionDescription(trans('libs/slug::slug.settings.description'))
            ->setValidatorClass(SlugSettingsRequest::class);

        foreach (SlugHelper::supportedModels() as $model => $name) {
            $settingKey = SlugHelper::getPermalinkSettingKey($model);
            $settingValue = SlugHelper::getPrefix($model, '', false);

            $form
                ->add(
                    $settingKey,
                    TextField::class,
                    TextFieldOption::make()
                        ->label(trans('libs/slug::slug.prefix_for', ['name' => $name]))
                        ->value(trim(old($settingKey, $settingValue), '/'))
                        ->helperText(SlugHelper::getHelperTextForPrefix($model))
                        ->placeholder(trans('libs/slug::slug.settings.prefix_placeholder', ['name' => strtolower($name)]))
                )
                ->add($settingKey . '-model-key', 'hidden', [
                    'value' => $model,
                ]);
        }

        $form
            ->add(
                SlugHelper::getSettingKey('public_single_ending_url'),
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('libs/slug::slug.public_single_ending_url'))
                    ->value(SlugHelper::getPublicSingleEndingURL())
                    ->helperText(SlugHelper::getHelperText(
                        Str::slug('your url here'),
                        SlugHelper::getPublicSingleEndingURL()
                    ))
                    ->placeholder('.html')
            )
            ->add(
                SlugHelper::getSettingKey('slug_turn_off_automatic_url_translation_into_latin'),
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('libs/slug::slug.settings.turn_off_automatic_url_translation_into_latin'))
                    ->value(SlugHelper::turnOffAutomaticUrlTranslationIntoLatin())
            )
            ->add(
                'html',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(fn () => apply_filters(
                        'setting_permalink_meta_boxes',
                        null,
                        request()->route()->parameters(),
                    ))
            );
    }
}
