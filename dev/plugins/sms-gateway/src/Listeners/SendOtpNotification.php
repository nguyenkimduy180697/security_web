<?php

namespace Dev\Sms\Listeners;

use Dev\Sms\Actions\SendOtpAction;
use Illuminate\Auth\Events\Registered;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendOtpNotification implements ShouldQueue
{
    public function __construct(
        protected SendOtpAction $sendOtpAction
    ) {
    }

    public function handle(Registered $event): void
    {
        $user = $event->user;

        if (empty($user->phone)) {
            return;
        }

        ($this->sendOtpAction)($user->phone);
    }
}
