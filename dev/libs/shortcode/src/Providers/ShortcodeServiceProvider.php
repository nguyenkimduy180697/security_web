<?php

namespace Dev\Shortcode\Providers;

use Dev\Base\Facades\Assets;
use Dev\Base\Supports\ServiceProvider;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\Shortcode\Compilers\ShortcodeCompiler;
use Dev\Shortcode\Shortcode;
use Dev\Shortcode\View\Factory;
use Illuminate\Support\Arr;

class ShortcodeServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->singleton('shortcode.compiler', ShortcodeCompiler::class);

        $this->app->singleton('shortcode', function ($app) {
            return new Shortcode($app['shortcode.compiler']);
        });

        $this->app->singleton('view', function ($app) {
            $resolver = $app['view.engine.resolver'];
            $finder = $app['view.finder'];
            $env = new Factory($resolver, $finder, $app['events'], $app['shortcode.compiler']);
            $env->setContainer($app);
            $env->share('app', $app);

            return $env;
        });

        $this->app['blade.compiler']->directive('shortcode', function ($expression) {
            return do_shortcode($expression);
        });

        $this->app->instance('shortcode.modal.rendered', false);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('libs/shortcode')
            ->loadRoutes()
            ->loadHelpers()
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->loadAndPublishConfigurations(['shortcode'])
            ->publishAssets();

        $this->app->booted(function (): void {
            $this->loadRoutes(['fronts']);

            add_filter(BASE_FILTER_FORM_EDITOR_BUTTONS, function (?string $buttons, array $attributes, string $id) {
                if (! $this->hasWithShortcode($attributes)) {
                    return $buttons;
                }

                $buttons = (string) $buttons;

                $buttons .= view('libs/shortcode::partials.shortcode-button', compact('id'))->render();

                return $buttons;
            }, 120, 3);

            add_filter(BASE_FILTER_FORM_EDITOR_BUTTONS_HEADER, function (?string $header, array $attributes) {
                if (! $this->hasWithShortcode($attributes)) {
                    return $header;
                }

                Assets::addStylesDirectly('vendor/core/libs/shortcode/css/shortcode.css');

                return $header;
            }, 120, 2);

            add_filter(BASE_FILTER_FORM_EDITOR_BUTTONS_FOOTER, function (?string $footer, array $attributes) {
                if (! $this->hasWithShortcode($attributes)) {
                    return $footer;
                }

                Assets::addScriptsDirectly('vendor/core/libs/shortcode/js/shortcode.js');

                $footer = (string) $footer;

                if (! $this->isShortcodeModalRendered()) {
                    $footer .= view('libs/shortcode::partials.shortcode-modal')->render();

                    $this->shortcodeModalRendered();
                }

                return $footer;
            }, 120, 2);
        });

        $this->app->register(HookServiceProvider::class);
    }

    protected function hasWithShortcode(array $attributes): bool
    {
        return (bool) Arr::get($attributes, 'with-short-code', false);
    }

    protected function isShortcodeModalRendered(): bool
    {
        return $this->app['shortcode.modal.rendered'] === true;
    }

    protected function shortcodeModalRendered(): void
    {
        $this->app->instance('shortcode.modal.rendered', true);
    }
}
