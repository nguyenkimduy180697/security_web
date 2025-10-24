<?php

namespace Dev\PluginManagement\Events;

use Dev\Base\Events\Event;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class RemovedPlugin extends Event
{
    use SerializesModels;
    use Dispatchable;

    public function __construct(public string $plugin)
    {
    }
}
