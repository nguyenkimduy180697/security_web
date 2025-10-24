<?php

namespace Dev\Sms\Contracts;

interface Factory
{
    /**
     * @param  string|null  $driver
     * @return \Dev\Sms\Contracts\Driver
     */
    public function driver($driver = null);
}
