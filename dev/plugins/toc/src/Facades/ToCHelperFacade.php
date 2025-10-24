<?php

namespace Dev\ToC\Facades;

use Dev\ToC\ToCHelper;
use Illuminate\Support\Facades\Facade;

class ToCHelperFacade extends Facade
{
    /**
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return ToCHelper::class;
    }
}
