<?php

namespace Dev\Pwa\Providers;

use Dev\Pwa\Commands\ClearPwaCacheCommand;
use Dev\Pwa\Commands\PublishPwaAssetsCommand;
use Illuminate\Support\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if ($this->app->runningInConsole()) {
            $this->commands([
                PublishPwaAssetsCommand::class,
                ClearPwaCacheCommand::class,
            ]);
        }
    }
}
