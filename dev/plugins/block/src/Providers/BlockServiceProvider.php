<?php

namespace Dev\Block\Providers;

use Dev\Base\Facades\DashboardMenu;
use Dev\Base\Forms\FormAbstract;
use Dev\Base\Supports\DashboardMenuItem;
use Dev\Base\Supports\ServiceProvider;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\Block\Models\Block;
use Dev\Block\Repositories\Eloquent\BlockRepository;
use Dev\Block\Repositories\Interfaces\BlockInterface;
use Dev\CustomField\Facades\CustomField;
use Dev\LanguageAdvanced\Supports\LanguageAdvancedManager;

class BlockServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(BlockInterface::class, function () {
            return new BlockRepository(new Block());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/block')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadMigrations();

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-block')
                        ->priority(410)
                        ->name('plugins/block::block.menu')
                        ->icon('ti ti-code')
                        ->route('block.index')
                );
        });

        if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(Block::class, [
                'name',
                'description',
                'content',
                'raw_content',
            ]);
        }

        $this->app->booted(function (): void {
            FormAbstract::beforeRendering(function (): void {
                if (defined('CUSTOM_FIELD_MODULE_SCREEN_NAME')) {
                    CustomField::registerModule(Block::class)
                        ->registerRule('basic', trans('plugins/block::block.name'), Block::class, function () {
                            return Block::query()
                                ->select([
                                    'id',
                                    'name',
                                ])->latest()
                                ->pluck('name', 'id')
                                ->all();
                        })
                        ->expandRule(
                            'other',
                            trans('plugins/custom-field::rules.model_name'),
                            'model_name',
                            function () {
                                return [
                                    Block::class => trans('plugins/block::block.name'),
                                ];
                            }
                        );
                }
            });

            $this->app->register(HookServiceProvider::class);
        });
    }
}
