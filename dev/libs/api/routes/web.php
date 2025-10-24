<?php

use Dev\Api\Http\Controllers\ApiController;
use Dev\Api\Http\Controllers\SanctumTokenController;
use Dev\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::name('api.')->prefix('settings/api')->group(function () {
        Route::prefix('sanctum-token')->name('sanctum-token.')->group(function () {
            Route::resource('/', SanctumTokenController::class)
                ->parameters(['' => 'sanctum-token'])
                ->except('edit', 'update', 'show');
        });

        Route::group(['permission' => 'api.settings'], function () {
            Route::get('/', [ApiController::class, 'edit'])->name('settings');
            Route::put('/', [ApiController::class, 'update'])->name('settings.update');
            Route::post('send-notification', [ApiController::class, 'sendNotification'])->name('send-notification');
            Route::get('device-tokens-stats', [ApiController::class, 'getDeviceTokensStats'])->name('device-tokens-stats');
            Route::post('upload-service-account', [ApiController::class, 'uploadServiceAccount'])->name('upload-service-account');
            Route::post('remove-service-account', [ApiController::class, 'removeServiceAccount'])->name('remove-service-account');
        });
    });
});
