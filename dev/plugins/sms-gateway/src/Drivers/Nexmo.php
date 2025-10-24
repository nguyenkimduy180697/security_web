<?php

namespace Dev\Sms\Drivers;

use Dev\Base\Forms\FormAbstract;
use Dev\Sms\DataTransferObjects\SmsResponse;
use Dev\Sms\Facades\Sms as SmsFacade;
use Dev\Sms\Forms\NexmoGatewayForm;
use Vonage\Client;
use Vonage\Client\Credentials\Basic;
use Vonage\SMS\Message\SMS;

class Nexmo extends AbstractDriver
{
    protected Client $client;

    public function __construct()
    {
        $key = SmsFacade::getSetting('key', 'nexmo');
        $secret = SmsFacade::getSetting('secret', 'nexmo');

        if (empty($key) || empty($secret)) {
            return;
        }

        $this->client = new Client(new Basic($key, $secret));
    }

    protected function performSend(string $to, string $message): SmsResponse
    {
        if (! isset($this->client)) {
            return new SmsResponse(success: false);
        }

        $response = $this->client->sms()->send(
            new SMS($to, $this->getFrom(), $message)
        );

        $message = $response->current();

        return new SmsResponse(
            success: $message->getStatus() === 0,
            messageId: $message->getMessageId(),
            response: $response->getAllMessagesRaw(),
        );
    }

    public function getLogo(): string
    {
        return asset('vendor/core/plugins/sms-gateway/images/nexmo.png');
    }

    public function getInstructions(): string
    {
        return view('plugins/sms-gateway::instructions.nexmo');
    }

    public function getSettingForm(): FormAbstract
    {
        return NexmoGatewayForm::create();
    }
}
