<?php

namespace Dev\Sms\Facades;

use Dev\Sms\GuardManager;
use Illuminate\Support\Facades\Facade;

/**
 * @method static string|null getGuard()
 * @method static string getTable(string|null $guard = null)
 * @method static array getGuards()
 *
 * @see \Dev\Sms\GuardManager
 */
class Guard extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return GuardManager::class;
    }
}
