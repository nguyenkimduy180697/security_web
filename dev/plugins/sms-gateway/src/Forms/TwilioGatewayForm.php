<?php

namespace Dev\Sms\Forms;

use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\TextField;

class TwilioGatewayForm extends SmsGatewayForm
{
    protected array $sensitiveFields = [
        'sid',
        'token',
    ];

    public function setup(): void
    {
        parent::setup();

        $this
            ->add(
                'sid',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/sms-gateway::twilio.sid'))
                    ->required()
            )
            ->add(
                'token',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/sms-gateway::twilio.token'))
                    ->required()
            )
            ->add(
                'from',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/sms-gateway::twilio.from'))
                    ->helperText(trans('plugins/sms-gateway::twilio.from_help'))
                    ->required()
            );
    }
}
