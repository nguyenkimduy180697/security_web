<?php

namespace Dev\Base\Contracts\Builders;

interface Extensible
{
    public static function getFilterPrefix(): string;

    public static function getGlobalClassName(): string;
}
