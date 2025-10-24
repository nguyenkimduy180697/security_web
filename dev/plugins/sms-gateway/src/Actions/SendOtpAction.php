<?php

namespace Dev\Sms\Actions;

use Dev\Sms\Facades\Otp;
use Dev\Sms\Facades\Sms;

class SendOtpAction
{
    public function __invoke(string $phone): void
    {
        $otp = Otp::generate($phone);

        $message = str_replace(
            '{code}',
            $otp->token,
            setting('fob_otp_message', 'Your OTP code is: {code}')
        );

        Sms::send($phone, $message);
    }
}
