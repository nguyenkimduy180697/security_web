<?php

namespace Dev\Sms\Drivers;

use Dev\Base\Facades\BaseHelper;
use Dev\Base\Forms\FormAbstract;
use Exception;
use Dev\Sms\DataTransferObjects\SmsResponse;
use Dev\Sms\Facades\Sms;
use Dev\Sms\Forms\TwilioGatewayForm;
use Twilio\Rest\Client;

class Twilio extends AbstractDriver
{
    protected Client $client;

    public function __construct()
    {
        $sid = Sms::getSetting('sid', 'twilio');
        $token = Sms::getSetting('token', 'twilio');

        if (empty($sid) || empty($token)) {
            return;
        }

        $this->client = new Client($sid, $token);
    }

    protected function performSend(string $to, string $message): SmsResponse
    {
        if (! isset($this->client)) {
            return new SmsResponse(success: false);
        }

        $response = $this->client->messages->create($to, [
            'from' => $this->getFrom(),
            'body' => $message,
        ]);

        return new SmsResponse(
            success: ! empty($response->sid),
            messageId: $response->sid,
            response: $response->toArray(),
        );
    }

    public function normalizePhoneNumber(string $phone): string
    {
        if (! isset($this->client)) {
            return new Exception('Twilio is not setup yet. Please setup credentials first.');
        }

        try {
            $phoneNumber = $this->client->lookups->v2->phoneNumbers($phone)->fetch();

            return $phoneNumber->phoneNumber;
        } catch (Exception $e) {
            BaseHelper::logError($e);

            return $phone;
        }
    }

    public function getLogo(): string
    {
        return asset('vendor/core/plugins/sms-gateway/images/twilio.png');
    }

    public function getInstructions(): string
    {
        return view('plugins/sms-gateway::instructions.twilio');
    }

    public function getSettingForm(): FormAbstract
    {
        return TwilioGatewayForm::create();
    }
}
