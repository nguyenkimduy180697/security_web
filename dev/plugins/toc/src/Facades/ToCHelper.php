<?php

namespace Dev\ToC\Facades;

use Dev\ToC\ToCHelper as Helper;
use Illuminate\Support\Facades\Facade;

/**
 * @method static string theContent(string $content)
 * @method static string extractHeadings(array &$find, array &$replace, ?string $content = '')
 * @method static \Dev\ToC\ToCHelper registerModule(string|array $model)
 * @method static array supportedModels()
 * @method static bool isSupportedModel(string $model)
 * @method static \Dev\ToC\ToCHelper unregisterModule(string $model)
 * @method static \Dev\ToC\ToCHelper setConfig(array $config)
 * @method static mixed config(?string $key = null, mixed $default = null)
 *
 * @see \Dev\ToC\ToCHelper
 */
class ToCHelper extends Facade
{
    /**
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return Helper::class;
    }
}
