<?php

namespace Dev\CodeHighlighter\Forms;

use Dev\Base\Facades\BaseHelper;
use Dev\Base\Facades\Html;
use Dev\Base\Forms\FieldOptions\MultiChecklistFieldOption;
use Dev\Base\Forms\FieldOptions\SelectFieldOption;
use Dev\Base\Forms\Fields\MultiCheckListField;
use Dev\Base\Forms\Fields\SelectField;
use Dev\CodeHighlighter\CodeHighlighter;
use Dev\Setting\Forms\SettingForm;
use Dev\CodeHighlighter\Http\Requests\CodeHighlighterSettingRequest;

class CodeHighlighterSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $exampleThemeLink = BaseHelper::clean(Html::link('https://highlightjs.org/demo', attributes: [
            'target' => '_blank',
            'rel' => 'noopener noreferrer',
        ]));

        $this
            ->setValidatorClass(CodeHighlighterSettingRequest::class)
            ->setSectionTitle(trans('plugins/code-highlighter::code-highlighter.settings.title'))
            ->setSectionDescription(trans('plugins/code-highlighter::code-highlighter.settings.description'))
            ->add('code_highlighter_theme', SelectField::class, SelectFieldOption::make()
                ->label(trans('plugins/code-highlighter::code-highlighter.settings.theme_label'))
                ->helperText(trans('plugins/code-highlighter::code-highlighter.settings.theme_help', ['link' => $exampleThemeLink]))
                ->searchable()
                ->selected(CodeHighlighter::getCurrentTheme())
                ->choices(CodeHighlighter::getSupportedThemes()))
            ->add(
                'code_highlighter_languages[]',
                MultiCheckListField::class,
                MultiChecklistFieldOption::make()
                    ->label(trans('plugins/code-highlighter::code-highlighter.settings.supported_languages_label'))
                    ->choices(CodeHighlighter::getSupportedLanguages())
                    ->selected(CodeHighlighter::getCurrentSupportedLanguages())
            );
    }
}
