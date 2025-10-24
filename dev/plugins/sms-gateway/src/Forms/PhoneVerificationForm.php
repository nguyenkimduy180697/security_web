<?php

namespace Dev\Sms\Forms;

use Dev\Base\Forms\FieldOptions\ButtonFieldOption;
use Dev\Base\Forms\FieldOptions\HtmlFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\HtmlField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Base\Forms\FormAbstract;

class PhoneVerificationForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->contentOnly()
            ->add(
                'otp',
                TextField::class,
                TextFieldOption::make()
                    ->label(false)
                    ->required()
                    ->attributes([
                        'autocomplete' => 'one-time-code',
                        'autofocus' => true,
                        'inputmode' => 'numeric',
                        'maxlength' => 6,
                        'pattern' => '\d{6}',
                    ])
            )
            ->add(
                'resend',
                HtmlField::class,
                HtmlFieldOption::make()->content(view('plugins/sms-gateway::phone-verification.resend'))
            )
            ->add(
                'submit',
                'submit',
                ButtonFieldOption::make()
                    ->label(__('Verify'))
                    ->cssClass('btn btn-primary w-100')
            );
    }
}
