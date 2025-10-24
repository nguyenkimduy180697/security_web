<?php

namespace Dev\GoogleMapsGeocoding\Providers;

use Dev\Base\Facades\PanelSectionManager;
use Dev\Base\PanelSections\PanelSectionItem;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\Setting\PanelSections\SettingOthersPanelSection;
use Illuminate\Support\ServiceProvider;

class GoogleMapsGeocodingServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this->setNamespace('plugins/google-maps-geocoding')
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->publishAssets()
            ->loadRoutes();

        PanelSectionManager::default()->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('google-maps-geocoding')
                    ->setTitle(trans('plugins/google-maps-geocoding::geocoding.settings.title'))
                    ->withIcon('ti ti-map-pin')
                    ->withDescription(trans('plugins/google-maps-geocoding::geocoding.settings.description'))
                    ->withPriority(190)
                    ->withRoute('google-maps-geocoding.settings')
            );
        });

        $this->app->booted(function () {
            $this->app->register(HookServiceProvider::class);
        });
    }
}
