<?php

namespace Dev\RssFeed\Facades;

use Dev\RssFeed\Supports\RssFeed as RssFeedSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \Dev\RssFeed\Supports\RssFeed addFeedLink(string $url, string $title)
 * @method static \Dev\RssFeed\Feed renderFeedItems(\Illuminate\Support\Collection $items, string $title, string $description)
 * @method static int remoteFilesize(string $url)
 *
 * @see \Dev\RssFeed\Supports\RssFeed
 */
class RssFeed extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return RssFeedSupport::class;
    }
}
