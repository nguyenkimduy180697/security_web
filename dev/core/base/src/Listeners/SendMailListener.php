<?php

namespace Dev\Base\Listeners;

use Dev\Base\Events\SendMailEvent;
use Dev\Base\Facades\BaseHelper;
use Dev\Base\Supports\EmailAbstract;
use Exception;
use Illuminate\Contracts\Mail\Mailer;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendMailListener implements ShouldQueue
{
    use InteractsWithQueue;

    public function __construct(protected Mailer $mailer)
    {
    }

    public function handle(SendMailEvent $event): void
    {
        try {
            $this->mailer->to($event->to)->send(new EmailAbstract($event->content, $event->title, $event->args));
        } catch (Exception $exception) {
            if ($event->debug) {
                throw $exception;
            }

            BaseHelper::logError($exception);
        }
    }
}
