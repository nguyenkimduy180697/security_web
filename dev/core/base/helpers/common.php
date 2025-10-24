<?php

use Dev\Base\Facades\AdminHelper;
use Dev\Base\Facades\DashboardMenu;
use Dev\Base\Facades\Html;
use Dev\Base\Facades\PageTitle;
use Dev\Base\Supports\Core;
use Dev\Base\Supports\DashboardMenu as DashboardMenuSupport;
use Dev\Base\Supports\Editor;
use Dev\Base\Supports\PageTitle as PageTitleSupport;

if (! function_exists('language_flag')) {
    function language_flag(?string $flag, ?string $name = null, int $width = 16): string
    {
        if (! $flag) {
            return '';
        }

        $flag = apply_filters('cms_language_flag', $flag, $name);

        $flagPath = BASE_LANGUAGE_FLAG_PATH . $flag . '.svg';

        if (file_exists(public_path($flagPath))) {
            $contents = file_get_contents(public_path($flagPath));

            $contents = trim(preg_replace('/^(<\?xml.+?\?>)/', '', $contents));

            return str_replace(
                '<svg',
                rtrim(sprintf('<svg style="height: %spx; width: auto;" class="flag"', $width)),
                $contents
            );
        }

        return Html::image(asset($flagPath), sprintf('%s flag', $name), [
            'title' => $name,
            'class' => 'flag',
            'style' => "height: {$width}px",
            'loading' => 'lazy',
        ]);
    }
}

if (! function_exists('render_editor')) {
    function render_editor(
        string $name,
        ?string $value = null,
        bool $withShortCode = false,
        array $attributes = []
    ): string {
        return (new Editor())->registerAssets()->render($name, $value, $withShortCode, $attributes);
    }
}

if (! function_exists('is_in_admin')) {
    function is_in_admin(bool $force = false): bool
    {
        return AdminHelper::isInAdmin($force);
    }
}

if (! function_exists('page_title')) {
    function page_title(): PageTitleSupport
    {
        return PageTitle::getFacadeRoot();
    }
}

if (! function_exists('dashboard_menu')) {
    function dashboard_menu(): DashboardMenuSupport
    {
        return DashboardMenu::getFacadeRoot();
    }
}

if (! function_exists('get_cms_version')) {
    function get_cms_version(): string
    {
        try {
            return Core::make()->version();
        } catch (Throwable) {
            return '...';
        }
    }
}

if (! function_exists('get_core_version')) {
    function get_core_version(): string
    {
        return '7.6.0';
    }
}

if (! function_exists('get_minimum_php_version')) {
    function get_minimum_php_version(): string
    {
        try {
            return Core::make()->minimumPhpVersion();
        } catch (Throwable) {
            return phpversion();
        }
    }
}

if (! function_exists('platform_path')) {
    function platform_path(?string $path = null, string $platform_path = 'dev'): string
    {
        $path = ltrim($path, DIRECTORY_SEPARATOR);

        return base_path($platform_path . ($path ? DIRECTORY_SEPARATOR . $path : ''));
    }
}

if (! function_exists('core_path')) {
    function core_path(?string $path = null, string $core_path = 'core'): string
    {
        return platform_path($core_path . ($path ? DIRECTORY_SEPARATOR . ltrim($path, DIRECTORY_SEPARATOR) : ''));
    }
}

if (! function_exists('package_path')) {
    function package_path(?string $path = null, string $package_path = 'libs'): string
    {
        return platform_path($package_path . ($path ? DIRECTORY_SEPARATOR . ltrim($path, DIRECTORY_SEPARATOR) : ''));
    }
}
