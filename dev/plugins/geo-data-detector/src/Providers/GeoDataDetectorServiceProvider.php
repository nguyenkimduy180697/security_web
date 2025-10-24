<?php

namespace Dev\GeoDataDetector\Providers;

use Dev\Base\Facades\PanelSectionManager;
use Dev\Base\PanelSections\PanelSectionItem;
use Dev\Base\Supports\ServiceProvider;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\Setting\PanelSections\SettingOthersPanelSection;

class GeoDataDetectorServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/geo-data-detector')
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->publishAssets()
            ->loadRoutes();

        $this->app->booted(function () {
            PanelSectionManager::beforeRendering(function (): void {
                PanelSectionManager::default()
                    ->registerItem(
                        SettingOthersPanelSection::class,
                        fn () => PanelSectionItem::make('geo-data-detector-settings')
                            ->setTitle(trans('plugins/geo-data-detector::geo-data-detector.name'))
                            ->withIcon('ti ti-world-pin')
                            ->withDescription(trans('plugins/geo-data-detector::geo-data-detector.description'))
                            ->withPriority(500)
                            ->withRoute('geo-data-detector.settings')
                    );
            });

            add_filter(THEME_FRONT_BODY, [$this, 'injectScript'], 15);
        });
    }

    public function injectScript(?string $html): string
    {
        return $html . '<script>
            if (! localStorage.getItem("user_currency") || ! localStorage.getItem("user_language")) {
                fetch("/geo-data-detector/detect", {
                        method: "GET",
                        headers: {
                            "Content-Type": "application/json",
                            "Accept": "application/json"
                        }
                    })
                    .then(response => response.json())
                    .then(response => {
                        if (! response.error && response.data.detected) {
                            localStorage.setItem("user_currency", response.data.currency || "USD");
                            localStorage.setItem("user_language", response.data.language || "en");
                            if (response.data.next_url) {
                                window.location.href = response.data.next_url;
                            } else {
                                window.location.reload();
                            }
                        }
                    })
                    .catch(error => console.error("GeoDataDetector API Error: ", error));
            }
        </script>';
    }
}
