<?php

namespace Dev\Block\Forms;

use Dev\Base\Forms\FieldOptions\CodeEditorFieldOption;
use Dev\Base\Forms\FieldOptions\ContentFieldOption;
use Dev\Base\Forms\FieldOptions\DescriptionFieldOption;
use Dev\Base\Forms\FieldOptions\NameFieldOption;
use Dev\Base\Forms\FieldOptions\StatusFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\CodeEditorField;
use Dev\Base\Forms\Fields\EditorField;
use Dev\Base\Forms\Fields\SelectField;
use Dev\Base\Forms\Fields\TextareaField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Base\Forms\FormAbstract;
use Dev\Block\Http\Requests\BlockRequest;
use Dev\Block\Models\Block;

class BlockForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Block::class)
            ->setValidatorClass(BlockRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add(
                'alias',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('core/base::forms.alias'))
                    ->placeholder(trans('core/base::forms.alias_placeholder'))
                    ->required()
                    ->maxLength(120)
            )
            ->add('description', TextareaField::class, DescriptionFieldOption::make())
            ->add(
                'content',
                EditorField::class,
                ContentFieldOption::make()
                    ->helperText(trans('plugins/block::block.content_helper_text'))
            )
            ->add(
                'raw_content',
                CodeEditorField::class,
                CodeEditorFieldOption::make()
                    ->label(trans('plugins/block::block.raw_content'))
                    ->placeholder(trans('plugins/block::block.raw_content_placeholder'))
                    ->helperText(trans('plugins/block::block.raw_content_helper_text'))
                    ->mode('html')
                    ->rows(4)
            )
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
