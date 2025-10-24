<?php

namespace Dev\Sms\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * @method static \Dev\Sms\Models\SmsOtp generate(string $identifier)
 * @method static bool verify(string $identifier, string $token)
 * @method static \Carbon\Carbon getExpiryTime(string $identifier)
 *
 * @see \Dev\Sms\Contracts\Otp
 */
class Otp extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return \Dev\Sms\Contracts\Otp::class;
    }
}
