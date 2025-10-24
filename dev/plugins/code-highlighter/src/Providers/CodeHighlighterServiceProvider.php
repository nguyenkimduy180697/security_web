<?php

namespace Dev\CodeHighlighter\Providers;

use Dev\Base\Facades\PanelSectionManager;
use Dev\Base\PanelSections\PanelSectionItem;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\CodeHighlighter\CodeHighlighter;
use Dev\Setting\PanelSections\SettingOthersPanelSection;
use Illuminate\Support\ServiceProvider;

class CodeHighlighterServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->setNamespace('plugins/code-highlighter');

        $this->app->instance('registered.plugins.code-highlighter', false);
    }

    public function boot(): void
    {
        if (! defined('BASE_ACTION_PUBLIC_RENDER_SINGLE') || ! defined('THEME_FRONT_FOOTER')) {
            return;
        }

        $this
            ->loadRoutes()
            ->publishAssets()
            ->loadRoutes()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations();

        PanelSectionManager::default()->beforeRendering(function () {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('code-highlighter')
                    ->setTitle(trans('plugins/code-highlighter::code-highlighter.settings.title'))
                    ->withDescription(trans('plugins/code-highlighter::code-highlighter.settings.description'))
                    ->withIcon('ti ti-file-code')
                    ->withPriority(9999)
                    ->withRoute('code-highlighter.settings')
            );
        });

        add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, function () {
            CodeHighlighter::registerAssets();
        }, 128, 0);

        add_filter(THEME_FRONT_FOOTER, function (?string $html): string {
            return $html . CodeHighlighter::renderInitialScript();
        }, 128, 0);
    }
}
