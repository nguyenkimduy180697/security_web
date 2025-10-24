<?php

use Dev\Base\Facades\AdminHelper;
use Dev\GoogleMapsGeocoding\Http\Controllers\Settings\GoogleMapsGeocodingSettingController;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::group(['prefix' => 'settings/google-maps-geocoding', 'as' => 'google-maps-geocoding.'], function () {
        Route::get('/', [GoogleMapsGeocodingSettingController::class, 'edit'])->name('settings');
        Route::put('/', [GoogleMapsGeocodingSettingController::class, 'update'])->name('settings.update');
    });
});
