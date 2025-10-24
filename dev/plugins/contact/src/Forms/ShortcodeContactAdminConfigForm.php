<?php

namespace Dev\Contact\Forms;

use Dev\Base\Forms\FieldOptions\MultiChecklistFieldOption;
use Dev\Base\Forms\Fields\MultiCheckListField;
use Dev\Shortcode\Forms\ShortcodeForm;

class ShortcodeContactAdminConfigForm extends ShortcodeForm
{
    public function setup(): void
    {
        parent::setup();

        $fields = [
            'phone' => trans('plugins/contact::contact.sender_phone'),
            'email' => trans('plugins/contact::contact.form_email'),
            'subject' => trans('plugins/contact::contact.form_subject'),
            'address' => trans('plugins/contact::contact.form_address'),
        ];

        $this
            ->add(
                'display_fields',
                MultiCheckListField::class,
                MultiChecklistFieldOption::make()
                    ->label(trans('plugins/contact::contact.display_fields'))
                    ->choices($fields)
                    ->defaultValue(array_keys($fields))
            )
            ->add(
                'mandatory_fields',
                MultiCheckListField::class,
                MultiChecklistFieldOption::make()
                    ->label(trans('plugins/contact::contact.mandatory_fields'))
                    ->helperText(trans('plugins/contact::contact.mandatory_fields_helper_text'))
                    ->choices($fields)
                    ->defaultValue(['email'])
            );
    }
}
