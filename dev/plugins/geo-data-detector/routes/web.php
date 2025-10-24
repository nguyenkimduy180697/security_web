<?php

use Dev\Base\Facades\AdminHelper;
use Dev\Base\Http\Middleware\RequiresJsonRequestMiddleware;
use Dev\Theme\Facades\Theme;
use Dev\GeoDataDetector\Http\Controllers\GeoDataDetectorController;
use Dev\GeoDataDetector\Http\Controllers\Settings\GeoDataDetectorSettingController;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function (): void {
    Route::prefix('geo-data-detector')
        ->name('geo-data-detector.')
        ->group(function (): void {
            Route::group(['prefix' => 'settings', 'permission' => 'geo-data-detector.settings'], function (): void {
                Route::get('/', [GeoDataDetectorSettingController::class, 'edit'])->name('settings');
                Route::put('/', [GeoDataDetectorSettingController::class, 'update'])->name('settings.update');
            });
        });
});

Theme::registerRoutes(function (): void {
    Route::get('geo-data-detector/detect', [GeoDataDetectorController::class, 'detect'])
        ->middleware(['web', RequiresJsonRequestMiddleware::class])
        ->name('geo-data-detector.detect');
});

