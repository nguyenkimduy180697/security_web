<?php

namespace Dev\RssFeed\Contracts;

use Dev\RssFeed\FeedItem;

interface Feedable
{
    public function toFeedItem(): FeedItem;
}
