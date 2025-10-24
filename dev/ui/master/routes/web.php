<?php

use Dev\Base\Http\Middleware\RequiresJsonRequestMiddleware;
use Dev\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;
use Theme\Master\Http\Controllers\MasterController;

Theme::registerRoutes(function (): void {
    Route::group(['controller' => MasterController::class], function (): void {
        Route::middleware(RequiresJsonRequestMiddleware::class)
            ->group(function (): void {
                Route::get('ajax/search', 'getSearch')->name('public.ajax.search');
            });

        // Add your custom route here
        // Ex: Route::get('hello', 'getHello');
    });
});

Theme::routes();
