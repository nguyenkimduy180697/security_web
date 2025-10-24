<?php

namespace Dev\Pwa\Providers;

use Dev\Base\Facades\AdminHelper;
use Dev\Base\Supports\ServiceProvider;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! is_plugin_active('pwa')) {
            return;
        }

        $enabled = setting('pwa_enable', false);
        if (! $enabled) {
            return;
        }

        // Don't load PWA in the admin panel
        if (AdminHelper::isInAdmin()) {
            return;
        }

        add_filter(THEME_FRONT_HEADER, function ($html) {
            $themeColor = setting('pwa_theme_color', '#0989ff');
            $appName = setting('pwa_app_name', setting('site_title', 'Progressive Web App'));

            $metaTags = view('plugins/pwa::header-meta', compact('themeColor', 'appName'))->render();

            return $html . $metaTags;
        }, 15);

        add_filter(THEME_FRONT_FOOTER, function ($html) {
            $script = view('plugins/pwa::footer-script')->render();

            return $html . $script;
        }, 15);
    }
}
