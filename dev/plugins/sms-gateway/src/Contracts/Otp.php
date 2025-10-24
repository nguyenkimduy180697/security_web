<?php

namespace Dev\Sms\Contracts;

use Carbon\Carbon;
use Dev\Sms\Models\SmsOtp as Model;

interface Otp
{
    public function generate(string $identifier): Model;

    public function verify(string $identifier, string $token): bool;

    public function getExpiryTime(string $identifier): Carbon;
}
