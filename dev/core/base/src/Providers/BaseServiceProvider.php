<?php

namespace Dev\Base\Providers;

use Dev\Base\Contracts\GlobalSearchableManager as GlobalSearchableManagerContract;
use Dev\Base\Contracts\PanelSections\Manager;
use Dev\Base\Exceptions\Handler;
use Dev\Base\Facades\AdminAppearance;
use Dev\Base\Facades\AdminHelper;
use Dev\Base\Facades\BaseHelper;
use Dev\Base\Facades\Breadcrumb as BreadcrumbFacade;
use Dev\Base\Facades\DashboardMenu;
use Dev\Base\Facades\PageTitle;
use Dev\Base\Facades\PanelSectionManager as PanelSectionManagerFacade;
use Dev\Base\GlobalSearch\GlobalSearchableManager;
use Dev\Base\Models\BaseModel;
use Dev\Base\PanelSections\Manager as PanelSectionManager;
use Dev\Base\PanelSections\System\SystemPanelSection;
use Dev\Base\Repositories\Eloquent\MetaBoxRepository;
use Dev\Base\Repositories\Interfaces\MetaBoxInterface;
use Dev\Base\Supports\Action;
use Dev\Base\Supports\Breadcrumb;
use Dev\Base\Supports\CustomResourceRegistrar;
use Dev\Base\Supports\DashboardMenuItem;
use Dev\Base\Supports\Database\Blueprint;
use Dev\Base\Supports\Filter;
use Dev\Base\Supports\GoogleFonts;
use Dev\Base\Supports\Helper;
use Dev\Base\Supports\ServiceProvider;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\Base\Widgets\AdminWidget;
use Dev\Base\Widgets\Contracts\AdminWidget as AdminWidgetContract;
use Dev\Setting\Providers\SettingServiceProvider;
use Dev\Setting\Supports\SettingStore;
use DateTimeZone;
use Illuminate\Config\Repository;
use Illuminate\Contracts\Debug\ExceptionHandler;
use Illuminate\Database\Schema\Builder;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Foundation\Application;
use Illuminate\Pagination\Paginator;
use Illuminate\Routing\ResourceRegistrar;
use Illuminate\Routing\Route;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

class BaseServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this
            ->setNamespace('core/base')
            ->loadAndPublishConfigurations('general')
            ->loadHelpers();

        $this->app->instance('core.middleware', []);

        config()->set(['session.cookie' => 'new_app_session']);

        $this->app->bind(ResourceRegistrar::class, function (Application $app) {
            return new CustomResourceRegistrar($app['router']);
        });

        $this->app->register(SettingServiceProvider::class);

        $this->app->singleton(ExceptionHandler::class, Handler::class);

        $this->app->singleton(Breadcrumb::class);

        $this->app->singleton(Manager::class, PanelSectionManager::class);

        $this->app->singleton(GlobalSearchableManagerContract::class, GlobalSearchableManager::class);

        $this->app->bind(MetaBoxInterface::class, MetaBoxRepository::class);

        $this->app->singleton('core.action', Action::class);

        $this->app->singleton('core.filter', Filter::class);

        $this->app->singleton(AdminWidgetContract::class, AdminWidget::class);

        $this->app->singleton('core.google-fonts', GoogleFonts::class);

        $this->registerRouteMacros();

        $this->prepareAliasesIfMissing();

        config()->set(['session.cookie' => Str::slug(config('core.base.general.session_cookie', 'apps_session'), '_')]);

        $this->overrideDefaultConfigs();

        Schema::defaultStringLength(191);
    }

    public function boot(): void
    {
        $this
            ->loadAndPublishConfigurations(['assets'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishViews()
            ->loadAnonymousComponents()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadMigrations()
            ->publishAssets();

        $this->app['blade.compiler']->anonymousComponentPath($this->getViewsPath() . '/components', 'core');

        $this->overridePackagesConfigs();

        $this->app->booted(function (): void {
            do_action(BASE_ACTION_INIT);
        });

        if (BaseHelper::isAdminRequest()) {
            $this->registerDashboardMenus();
            $this->registerPanelSections();
        }

        Paginator::useBootstrap();

        $this->forceSSL();

        $this->configureIni();

        $this->app->extend('db.schema', function (Builder $schema) {
            $schema->blueprintResolver(function ($table, $callback, $prefix) {
                return new Blueprint($table, $callback, $prefix);
            });

            return $schema;
        });
    }

    protected function registerDashboardMenus(): void
    {
        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-core-system')
                        ->priority(10000)
                        ->name('core/base::layouts.platform_admin')
                        ->icon('ti ti-user-shield')
                        ->route('system.index')
                        ->permission('core.system')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-core-tools')
                        ->priority(9000)
                        ->name('core/base::layouts.tools')
                        ->icon('ti ti-tool')
                        ->permission('core.tools')
                );
        });
    }

    protected function registerPanelSections(): void
    {
        PanelSectionManagerFacade::group('system')->beforeRendering(function (): void {
            PanelSectionManagerFacade::setGroupName(trans('core/base::layouts.platform_admin'))
                ->register(SystemPanelSection::class);
        });
    }

    protected function configureIni(): void
    {
        static $memoryLimit = null;
        static $maxExecutionTime = null;

        if ($memoryLimit === null) {
            $memoryLimit = @ini_get('memory_limit');
        }

        $currentLimitInt = Helper::convertHrToBytes($memoryLimit);
        $baseConfig = $this->getBaseConfig();
        $configMemoryLimit = Arr::get($baseConfig, 'memory_limit');

        if (! $configMemoryLimit) {
            $configMemoryLimit = Helper::isIniValueChangeable('memory_limit') === false
                ? $memoryLimit
                : '256M';
        }

        $limitInt = Helper::convertHrToBytes($configMemoryLimit);
        if ($currentLimitInt !== -1 && ($limitInt === -1 || $limitInt > $currentLimitInt)) {
            BaseHelper::iniSet('memory_limit', $configMemoryLimit);
        }

        if ($maxExecutionTime === null) {
            $maxExecutionTime = @ini_get('max_execution_time');
        }

        $configMaxExecutionTime = Arr::get($baseConfig, 'max_execution_time');
        if ($maxExecutionTime < $configMaxExecutionTime) {
            BaseHelper::iniSet('max_execution_time', $configMaxExecutionTime);
        }
    }

    protected function getConfigValue(string $key, mixed $default = null): mixed
    {
        return config("core.base.general.{$key}", $default);
    }

    protected function forceSSL(): void
    {
        $forceUrl = $this->getConfigValue('force_root_url');
        if (! empty($forceUrl)) {
            URL::useOrigin($forceUrl);
        }

        $forceSchema = $this->getConfigValue('force_schema');
        if (! empty($forceSchema)) {
            $this->app['request']->server->set('HTTPS', 'on');
            URL::forceScheme($forceSchema);
        }
    }

    protected function getBaseConfig(): array
    {
        return $this->getConfig()->get('core.base.general', []);
    }

    protected function getConfig(): Repository
    {
        return $this->app['config'];
    }

    protected function overrideDefaultConfigs(): void
    {
        $config = $this->getConfig();

        $config->set([
            'app.debug_blacklist' => [
                '_ENV' => [
                    'APP_KEY',
                    'ADMIN_DIR',
                    'DB_DATABASE',
                    'DB_USERNAME',
                    'DB_PASSWORD',
                    'REDIS_PASSWORD',
                    'MAIL_PASSWORD',
                    'PUSHER_APP_KEY',
                    'PUSHER_APP_SECRET',
                ],
                '_SERVER' => [
                    'APP_KEY',
                    'ADMIN_DIR',
                    'DB_DATABASE',
                    'DB_USERNAME',
                    'DB_PASSWORD',
                    'REDIS_PASSWORD',
                    'MAIL_PASSWORD',
                    'PUSHER_APP_KEY',
                    'PUSHER_APP_SECRET',
                ],
                '_POST' => [
                    'password',
                ],
            ],
            'debugbar.enabled' => $this->app->hasDebugModeEnabled() &&
                ! $this->app->runningInConsole() &&
                ! $this->app->environment(['testing', 'production']),
            'debugbar.capture_ajax' => false,
            'debugbar.remote_sites_path' => '',
            'scribe.type' => 'static',
            'scribe.assets_directory' => 'vendor/core/libs/api',
            'scribe.routes' => [
                [
                    'match' => [
                        'prefixes' => ['api/*'],
                        'domains' => ['*'],
                    ],
                    'include' => [],
                    'exclude' => [],
                ],
            ],
        ]);

        if (
            ! $config->has('logging.channels.deprecations')
            && $this->app->isLocal()
            && $this->app->hasDebugModeEnabled()
        ) {
            $config->set([
                'logging.channels.deprecations' => [
                    'driver' => 'single',
                    'path' => storage_path('logs/php-deprecation-warnings.log'),
                ],
            ]);
        }
    }

    protected function overridePackagesConfigs(): void
    {
        $config = $this->getConfig();

        $baseConfig = $this->getBaseConfig();

        /**
         * @var SettingStore $setting
         */
        $setting = $this->app[SettingStore::class];

        $cacheKey = 'core.base.boot_settings';
        $bootSettings = cache()->remember($cacheKey, 3600, function () use ($setting, $config) {
            return [
                'timezone' => $setting->get('time_zone', $config->get('app.timezone')),
                'locale' => $setting->get('locale', $config->get('app.locale')),
            ];
        });

        $timezone = $bootSettings['timezone'];
        $locale = $bootSettings['locale'];

        $this->app->setLocale($locale);

        if (in_array($timezone, DateTimeZone::listIdentifiers())) {
            date_default_timezone_set($timezone);
        }

        if ($iframeRegex = Arr::get($baseConfig, 'iframe_regex')) {
            $baseConfig['purifier']['default']['URI.SafeIframeRegexp'] = $iframeRegex;
        } else {
            $allowedIframeUrls = [
                'www.youtube.com/embed/',
                'player.vimeo.com/video/',
                'maps.google.com/maps',
                'www.google.com/maps|docs.google.com/',
                'drive.google.com/',
                'view.officeapps.live.com/op/embed.aspx',
                'onedrive.live.com/embed',
                'open.spotify.com/embed',
                'www.googletagmanager.com',
                'www.facebook.com/plugins',
                'tiktok.com/embed',
                parse_url($config->get('app.url'), PHP_URL_HOST),
            ];

            if ($extraUrl = Arr::get($baseConfig, 'allowed_iframe_urls', [])) {
                $allowedIframeUrls = [
                    ...$allowedIframeUrls,
                    ...explode('|', $extraUrl),
                ];
            }

            $allowedIframeUrls = implode('|', apply_filters('core_allowed_iframe_urls', $allowedIframeUrls));

            $baseConfig['purifier']['default']['URI.SafeIframeRegexp'] = '%^(http://|https://|//)(' . $allowedIframeUrls . ')%';
        }

        $config->set([
            'app.locale' => $locale,
            'app.timezone' => $timezone,
            'purifier.settings' => [
                ...$config->get('purifier.settings', []),
                ...Arr::get($baseConfig, 'purifier', []),
            ],
            'ziggy.except' => ['debugbar.*'],
            'datatables-buttons.pdf_generator' => 'excel',
            'datatables-html.script' => 'core/table::script',
            'datatables-html.editor' => 'core/table::editor',
            'excel.exports.csv.use_bom' => true,
            'dompdf.public_path' => public_path(),
            'database.connections.mysql.strict' => Arr::get($baseConfig, 'db_strict_mode'),
            'database.connections.mysql.prefix' => Arr::get($baseConfig, 'db_prefix'),
            'excel.imports.ignore_empty' => true,
            'excel.imports.csv.input_encoding' => Arr::get($baseConfig, 'csv_import_input_encoding', 'UTF-8'),
        ]);
    }

    protected function registerRouteMacros(): void
    {
        Route::macro('wherePrimaryKey', function (array|string|null $name = 'id') {
            if (! $name) {
                $name = 'id';
            }

            /**
             * @var Route $this
             */
            if (BaseModel::determineIfUsingUuidsForId()) {
                return $this->whereUuid($name);
            }

            if (BaseModel::determineIfUsingUlidsForId()) {
                return $this->whereUlid($name);
            }

            return $this->whereNumber($name);
        });

        Route::macro('permission', function (array|string|bool|null $value) {
            /**
             * @var Route $this
             */
            $action = $this->getAction();
            Arr::set($action, 'permission', $value);

            return $this->setAction($action);
        });
    }

    protected function prepareAliasesIfMissing(): void
    {
        $aliasLoader = AliasLoader::getInstance();

        if (! class_exists('BaseHelper')) {
            $aliasLoader->alias('BaseHelper', BaseHelper::class);
            $aliasLoader->alias('DashboardMenu', DashboardMenu::class);
            $aliasLoader->alias('PageTitle', PageTitle::class);
        }

        if (! class_exists('Breadcrumb')) {
            $aliasLoader->alias('Breadcrumb', BreadcrumbFacade::class);
        }

        if (! class_exists('PanelSectionManager')) {
            $aliasLoader->alias('PanelSectionManager', PanelSectionManagerFacade::class);
        }

        if (! class_exists('AdminAppearance')) {
            $aliasLoader->alias('AdminAppearance', AdminAppearance::class);
        }

        if (! class_exists('AdminHelper')) {
            $aliasLoader->alias('AdminHelper', AdminHelper::class);
        }
    }
}
