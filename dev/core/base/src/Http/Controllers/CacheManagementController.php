<?php

namespace Dev\Base\Http\Controllers;

use Dev\Base\Facades\Assets;
use Dev\Base\Facades\BaseHelper;
use Dev\Base\Http\Requests\ClearCacheRequest;
use Dev\Base\Services\ClearCacheService;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\File;

class CacheManagementController extends BaseSystemController
{
    public function index(): View
    {
        $this->pageTitle(trans('core/base::cache.cache_management'));

        Assets::addScriptsDirectly('vendor/core/core/base/js/cache.js');

        $cacheSize = 0;
        $cachePath = storage_path('framework/cache');

        if (File::isDirectory($cachePath)) {
            $cacheSize = $this->calculateDirectorySize($cachePath);
        }

        $formattedCacheSize = BaseHelper::humanFilesize($cacheSize);

        return view('core/base::system.cache', compact('formattedCacheSize', 'cacheSize'));
    }

    public function destroy(ClearCacheRequest $request, ClearCacheService $clearCacheService)
    {
        switch ($type = $request->input('type')) {
            case 'clear_cms_cache':
                $clearCacheService->clearFrameworkCache();
                $clearCacheService->clearGoogleFontsCache();
                $clearCacheService->clearPurifier();
                $clearCacheService->clearDebugbar();

                break;
            case 'refresh_compiled_views':
                $clearCacheService->clearCompiledViews();

                break;
            case 'clear_config_cache':
                $clearCacheService->clearConfig();

                break;
            case 'clear_route_cache':
                $clearCacheService->clearRoutesCache();

                break;
            case 'clear_log':
                $clearCacheService->clearLogs();

                break;
            case 'optimize':
                $results = $clearCacheService->runOptimization();

                if ($results['success']) {
                    return $this
                        ->httpResponse()
                        ->setMessage($results['message']);
                }

                return $this
                    ->httpResponse()
                    ->setError()
                    ->setMessage($results['message']);

            case 'clear_optimize':
                $results = $clearCacheService->clearOptimization();

                if ($results['success']) {
                    return $this
                        ->httpResponse()
                        ->setMessage($results['message']);
                }

                return $this
                    ->httpResponse()
                    ->setError()
                    ->setMessage($results['message']);
        }

        return $this
            ->httpResponse()
            ->setMessage(trans("core/base::cache.commands.$type.success_msg"));
    }

    /**
     * Calculate the size of a directory recursively
     */
    protected function calculateDirectorySize(string $directory): int
    {
        $size = 0;

        foreach (File::glob(rtrim($directory, '/') . '/*', GLOB_NOSORT) as $each) {
            $size += File::isFile($each) ? File::size($each) : $this->calculateDirectorySize($each);
        }

        return $size;
    }
}
