<?php

use Dev\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'Dev\Block\Http\Controllers'], function (): void {
    AdminHelper::registerRoutes(function (): void {
        Route::group(['prefix' => 'blocks', 'as' => 'block.'], function (): void {
            Route::resource('', 'BlockController')->parameters(['' => 'block']);
        });
    });
});
