<?php

namespace Dev\Pwa\Providers;

use Dev\Base\Facades\PanelSectionManager;
use Dev\Base\PanelSections\PanelSectionItem;
use Dev\Base\Supports\ServiceProvider;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\Setting\PanelSections\SettingOthersPanelSection;

class PwaServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->register(HookServiceProvider::class);
        $this->app->register(CommandServiceProvider::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/pwa')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['general', 'permissions'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->publishAssets();

        PanelSectionManager::default()->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('pwa')
                    ->setTitle(trans('plugins/pwa::pwa.settings.title'))
                    ->withIcon('ti ti-device-mobile')
                    ->withDescription(trans('plugins/pwa::pwa.settings.description'))
                    ->withPriority(170)
                    ->withRoute('pwa.settings')
            );
        });

        $this->app->booted(function () {
            $this->app->register(EventServiceProvider::class);
        });
    }
}
