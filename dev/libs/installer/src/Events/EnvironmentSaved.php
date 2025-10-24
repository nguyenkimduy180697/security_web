<?php

namespace Dev\Installer\Events;

use Dev\Base\Events\Event;
use Illuminate\Http\Request;

class EnvironmentSaved extends Event
{
    public function __construct(public Request $request)
    {
    }
}
