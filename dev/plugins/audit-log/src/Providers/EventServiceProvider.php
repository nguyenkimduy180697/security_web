<?php

namespace Dev\AuditLog\Providers;

use Dev\AuditLog\Events\AuditHandlerEvent;
use Dev\AuditLog\Listeners\AuditHandlerListener;
use Dev\AuditLog\Listeners\CreatedContentListener;
use Dev\AuditLog\Listeners\CustomerLoginListener;
use Dev\AuditLog\Listeners\CustomerLogoutListener;
use Dev\AuditLog\Listeners\CustomerRegistrationListener;
use Dev\AuditLog\Listeners\DeletedContentListener;
use Dev\AuditLog\Listeners\LoginListener;
use Dev\AuditLog\Listeners\UpdatedContentListener;
use Dev\Base\Events\CreatedContentEvent;
use Dev\Base\Events\DeletedContentEvent;
use Dev\Base\Events\UpdatedContentEvent;
use Illuminate\Auth\Events\Login;
use Illuminate\Auth\Events\Logout;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        AuditHandlerEvent::class => [
            AuditHandlerListener::class,
        ],
        Login::class => [
            LoginListener::class,
            CustomerLoginListener::class,
        ],
        Logout::class => [
            CustomerLogoutListener::class,
        ],
        Registered::class => [
            CustomerRegistrationListener::class,
        ],
        UpdatedContentEvent::class => [
            UpdatedContentListener::class,
        ],
        CreatedContentEvent::class => [
            CreatedContentListener::class,
        ],
        DeletedContentEvent::class => [
            DeletedContentListener::class,
        ],
    ];
}
