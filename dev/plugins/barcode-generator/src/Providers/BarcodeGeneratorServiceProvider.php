<?php

namespace Dev\BarcodeGenerator\Providers;

use Dev\Base\Facades\DashboardMenu;
use Dev\Base\Facades\PanelSectionManager;
use Dev\Base\PanelSections\PanelSectionItem;
use Dev\Base\Supports\DashboardMenuItem;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\Setting\PanelSections\SettingOthersPanelSection;
use Illuminate\Support\ServiceProvider;

class BarcodeGeneratorServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this->setNamespace('plugins/barcode-generator')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->publishAssets()
            ->loadAndPublishViews()
            ->loadRoutes();

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-barcode-generator')
                        ->priority(420)
                        ->name('plugins/barcode-generator::barcode-generator.name')
                        ->icon('ti ti-barcode')
                        ->route('barcode-generator.index')
                        ->permissions('barcode-generator.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-barcode-generator-generate')
                        ->priority(1)
                        ->parentId('cms-plugins-barcode-generator')
                        ->name('plugins/barcode-generator::barcode-generator.menu.generate')
                        ->icon('ti ti-printer')
                        ->route('barcode-generator.index')
                        ->permissions('barcode-generator.generate')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-barcode-generator-templates')
                        ->priority(2)
                        ->parentId('cms-plugins-barcode-generator')
                        ->name('plugins/barcode-generator::barcode-generator.menu.templates')
                        ->icon('ti ti-template')
                        ->route('barcode-generator.templates.index')
                        ->permissions('barcode-generator.templates')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-barcode-generator-settings')
                        ->priority(3)
                        ->parentId('cms-plugins-barcode-generator')
                        ->name('plugins/barcode-generator::barcode-generator.menu.settings')
                        ->icon('ti ti-settings')
                        ->route('barcode-generator.settings')
                        ->permissions('barcode-generator.settings')
                );
        });

        PanelSectionManager::default()->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('barcode-generator')
                    ->setTitle(trans('plugins/barcode-generator::barcode-generator.settings.title'))
                    ->withIcon('ti ti-barcode')
                    ->withDescription(trans('plugins/barcode-generator::barcode-generator.settings.description'))
                    ->withPriority(190)
                    ->withRoute('barcode-generator.settings')
            );
        });

        $this->app->booted(function () {
            $this->app->register(HookServiceProvider::class);
        });
    }
}
