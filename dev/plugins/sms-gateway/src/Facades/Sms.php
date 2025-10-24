<?php

namespace Dev\Sms\Facades;

use Dev\Sms\Contracts\Factory;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \Dev\Sms\Drivers\Twilio createTwilioDriver()
 * @method static \Dev\Sms\Drivers\Nexmo createNexmoDriver()
 * @method static string getDefaultDriver()
 * @method static array getDrivers()
 * @method static array getProviders(bool $activated = false)
 * @method static mixed|null getSetting(string $key, string|null $driver = null, mixed|null $default = null)
 * @method static mixed driver(string|null $driver = null)
 * @method static \Dev\Sms\SmsManager extend(string $driver, \Closure $callback)
 * @method static \Illuminate\Contracts\Container\Container getContainer()
 * @method static \Dev\Sms\SmsManager setContainer(\Illuminate\Contracts\Container\Container $container)
 * @method static \Dev\Sms\SmsManager forgetDrivers()
 *
 * @see \Dev\Sms\SmsManager
 */
class Sms extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return Factory::class;
    }
}
