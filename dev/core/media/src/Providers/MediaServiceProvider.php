<?php

namespace Dev\Media\Providers;

use Aws\S3\S3Client;
use Dev\Base\Facades\DashboardMenu;
use Dev\Base\Supports\DashboardMenuItem;
use Dev\Base\Supports\ServiceProvider;
use Dev\Base\Traits\LoadAndPublishDataTrait;
use Dev\Media\Chunks\Storage\ChunkStorage;
use Dev\Media\Commands\ClearChunksCommand;
use Dev\Media\Commands\CropImageCommand;
use Dev\Media\Commands\DeleteThumbnailCommand;
use Dev\Media\Commands\GenerateThumbnailCommand;
use Dev\Media\Commands\InsertWatermarkCommand;
use Dev\Media\Facades\AppMedia;
use Dev\Media\Models\MediaFile;
use Dev\Media\Models\MediaFolder;
use Dev\Media\Models\MediaSetting;
use Dev\Media\Repositories\Eloquent\MediaFileRepository;
use Dev\Media\Repositories\Eloquent\MediaFolderRepository;
use Dev\Media\Repositories\Eloquent\MediaSettingRepository;
use Dev\Media\Repositories\Interfaces\MediaFileInterface;
use Dev\Media\Repositories\Interfaces\MediaFolderInterface;
use Dev\Media\Repositories\Interfaces\MediaSettingInterface;
use Dev\Media\Storage\BunnyCDN\BunnyCDNAdapter;
use Dev\Media\Storage\BunnyCDN\BunnyCDNClient;
use Dev\Setting\Supports\SettingStore;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Filesystem\AwsS3V3Adapter as IlluminateAwsS3V3Adapter;
use Illuminate\Filesystem\FilesystemAdapter;
use Illuminate\Filesystem\FilesystemManager;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Support\Facades\Storage;
use League\Flysystem\AwsS3V3\AwsS3V3Adapter;
use League\Flysystem\Filesystem;

/**
 * @since 02/07/2016 09:50 AM
 */
class MediaServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(MediaFileInterface::class, function () {
            return new MediaFileRepository(new MediaFile());
        });

        $this->app->bind(MediaFolderInterface::class, function () {
            return new MediaFolderRepository(new MediaFolder());
        });

        $this->app->bind(MediaSettingInterface::class, function () {
            return new MediaSettingRepository(new MediaSetting());
        });

        $this->app->singleton(ChunkStorage::class);

        if (! class_exists('AppMedia')) {
            AliasLoader::getInstance()->alias('AppMedia', AppMedia::class);
        }
    }

    public function boot(): void
    {
        $this
            ->setNamespace('core/media')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['media'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->loadRoutes()
            ->publishAssets();

        $config = $this->app->make('config');
        $setting = $this->app->make(SettingStore::class);

        $config->set([
            'core.media.media.chunk.enabled' => (bool) $setting->get(
                'media_chunk_enabled',
                $config->get('core.media.media.chunk.enabled')
            ),
            'core.media.media.chunk.chunk_size' => (int) $setting->get(
                'media_chunk_size',
                $config->get('core.media.media.chunk.chunk_size')
            ),
            'core.media.media.chunk.max_file_size' => (int) $setting->get(
                'media_max_file_size',
                $config->get('core.media.media.chunk.max_file_size')
            ),
        ]);

        if (! $config->get('core.media.media.use_storage_symlink')) {
            AppMedia::setUploadPathAndURLToPublic();
        }

        $this->app->resolving(FilesystemManager::class, function (): void {
            Storage::extend('wasabi', function ($app, $config) {
                $config['url'] = 'https://' . $config['bucket'] . '.s3.' . $config['region'] . '.wasabisys.com/';

                $client = new S3Client([
                    'endpoint' => $config['url'],
                    'bucket_endpoint' => true,
                    'credentials' => [
                        'key' => $config['key'],
                        'secret' => $config['secret'],
                    ],
                    'region' => $config['region'],
                    'version' => 'latest',
                ]);

                $adapter = new AwsS3V3Adapter($client, $config['bucket'], trim($config['root'], '/'));

                return new IlluminateAwsS3V3Adapter(
                    new Filesystem($adapter, $config),
                    $adapter,
                    $config,
                    $client,
                );
            });

            Storage::extend('bunnycdn', function ($app, $config) {
                $adapter = new BunnyCDNAdapter(
                    new BunnyCDNClient(
                        $config['storage_zone'],
                        $config['api_key'],
                        $config['region']
                    ),
                    'https://' . $config['hostname']
                );

                return new FilesystemAdapter(
                    new Filesystem($adapter, $config),
                    $adapter,
                    $config
                );
            });

            $config = $this->app->make('config');
            $setting = $this->app->make(SettingStore::class);

            $mediaDriver = AppMedia::getMediaDriver();

            $config->set([
                'filesystems.default' => $mediaDriver,
                'filesystems.disks.public.throw' => true,
            ]);

            switch ($mediaDriver) {
                case 's3':
                    AppMedia::setS3Disk([
                        'key' => $setting->get('media_aws_access_key_id', $config->get('filesystems.disks.s3.key')),
                        'secret' => $setting->get('media_aws_secret_key', $config->get('filesystems.disks.s3.secret')),
                        'region' => $setting->get('media_aws_default_region', $config->get('filesystems.disks.s3.region')),
                        'bucket' => $setting->get('media_aws_bucket', $config->get('filesystems.disks.s3.bucket')),
                        'url' => $setting->get('media_aws_url', $config->get('filesystems.disks.s3.url')),
                        'endpoint' => $setting->get('media_aws_endpoint', $config->get('filesystems.disks.s3.endpoint')) ?: null,
                        'use_path_style_endpoint' => (bool) $setting->get('media_aws_use_path_style_endpoint', $config->get('filesystems.disks.s3.use_path_style_endpoint')),
                    ]);

                    break;
                case 'r2':
                    AppMedia::setR2Disk([
                        'key' => $setting->get('media_r2_access_key_id'),
                        'secret' => $setting->get('media_r2_secret_key'),
                        'bucket' => $setting->get('media_r2_bucket'),
                        'url' => $setting->get('media_r2_url'),
                        'endpoint' => $setting->get('media_r2_endpoint') ?: null,
                        'use_path_style_endpoint' => (bool) $setting->get('media_r2_use_path_style_endpoint', true),
                    ]);

                    break;
                case 'wasabi':
                    AppMedia::setWasabiDisk([
                        'key' => $setting->get('media_wasabi_access_key_id'),
                        'secret' => $setting->get('media_wasabi_secret_key'),
                        'region' => $setting->get('media_wasabi_default_region'),
                        'bucket' => $setting->get('media_wasabi_bucket'),
                        'root' => $setting->get('media_wasabi_root', '/'),
                    ]);

                    break;

                case 'bunnycdn':
                    AppMedia::setBunnyCdnDisk([
                        'hostname' => $setting->get('media_bunnycdn_hostname'),
                        'storage_zone' => $setting->get('media_bunnycdn_zone'),
                        'api_key' => $setting->get('media_bunnycdn_key'),
                        'region' => $setting->get('media_bunnycdn_region'),
                    ]);

                    break;

                case 'do_spaces':
                    AppMedia::setDoSpacesDisk([
                        'key' => $setting->get('media_do_spaces_access_key_id'),
                        'secret' => $setting->get('media_do_spaces_secret_key'),
                        'region' => $setting->get('media_do_spaces_default_region'),
                        'bucket' => $setting->get('media_do_spaces_bucket'),
                        'endpoint' => $setting->get('media_do_spaces_endpoint'),
                        'use_path_style_endpoint' => (bool) $setting->get('media_do_spaces_use_path_style_endpoint', false),
                    ]);

                    break;
                case 'backblaze':
                    AppMedia::setBackblazeDisk([
                        'key' => $setting->get('media_backblaze_access_key_id'),
                        'secret' => $setting->get('media_backblaze_secret_key'),
                        'region' => $setting->get('media_backblaze_default_region'),
                        'bucket' => $setting->get('media_backblaze_bucket'),
                        'url' => $setting->get('media_backblaze_url'),
                        'endpoint' => $setting->get('media_backblaze_endpoint'),
                        'use_path_style_endpoint' => (bool) $setting->get('media_backblaze_use_path_style_endpoint', false),
                    ]);

                    break;

                default:
                    do_action('cms_setup_media_disk', $mediaDriver);

                    break;
            }
        });

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-core-media')
                        ->priority(999)
                        ->icon('ti ti-folder')
                        ->name('core/media::media.menu_name')
                        ->route('media.index')
                );
        });

        if ($this->app->runningInConsole()) {
            $this->commands([
                GenerateThumbnailCommand::class,
                CropImageCommand::class,
                DeleteThumbnailCommand::class,
                InsertWatermarkCommand::class,
                ClearChunksCommand::class,
            ]);

            $this->app->afterResolving(Schedule::class, function (Schedule $schedule): void {
                if (AppMedia::getConfig('chunk.clear.schedule.enabled')) {
                    $schedule
                        ->command(ClearChunksCommand::class)
                        ->cron(AppMedia::getConfig('chunk.clear.schedule.cron'));
                }
            });
        }
    }
}
