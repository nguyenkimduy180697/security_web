<?php

namespace Dev\Sms\Providers;

use Dev\Sms\Listeners\SendOtpNotification;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        Registered::class => [
            SendOtpNotification::class,
        ],
    ];
}
