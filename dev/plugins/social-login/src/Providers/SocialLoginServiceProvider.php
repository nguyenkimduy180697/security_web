<?php

namespace Dev\SocialLogin\Providers;

use Dev\Base\Facades\PanelSectionManager;
use Dev\Base\PanelSections\PanelSectionItem;
use Dev\Base\Supports\ServiceProvider;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\Setting\PanelSections\SettingOthersPanelSection;
use Dev\SocialLogin\Console\RefreshSocialTokensCommand;
use Dev\SocialLogin\Facades\SocialService;
use Dev\SocialLogin\Services\AppleJwtService;
use Dev\SocialLogin\Services\SocialLoginService;
use Dev\SocialLogin\Supports\SocialService as SocialServiceSupport;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\AliasLoader;

class SocialLoginServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/social-login')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['general'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations()
            ->loadRoutes(['web', 'api'])
            ->publishAssets();

        AliasLoader::getInstance()->alias('SocialService', SocialService::class);

        PanelSectionManager::default()->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('social-login')
                    ->setTitle(trans('plugins/social-login::social-login.menu'))
                    ->withDescription(trans('plugins/social-login::social-login.description'))
                    ->withIcon('ti ti-social')
                    ->withPriority(100)
                    ->withRoute('social-login.settings')
            );
        });

        $this->app->register(HookServiceProvider::class);

        $this->app->afterResolving(Schedule::class, function (Schedule $schedule): void {
            $schedule->command(RefreshSocialTokensCommand::class)->daily();
        });
    }

    public function register(): void
    {
        $this->app->singleton(SocialServiceSupport::class, function () {
            return new SocialServiceSupport();
        });

        $this->app->singleton(SocialLoginService::class);
        $this->app->singleton(AppleJwtService::class);

        $this->commands([
            RefreshSocialTokensCommand::class,
        ]);
    }
}
