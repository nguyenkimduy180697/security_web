<?php

use Dev\Base\Facades\AdminHelper;
use Dev\Base\Http\Middleware\DisableInDemoModeMiddleware;
use Dev\Theme\Facades\Theme;
use Dev\Sms\Facades\Guard;
use Dev\Sms\Http\Controllers\PhoneVerificationController;
use Dev\Sms\Http\Controllers\ResendOtpController;
use Dev\Sms\Http\Controllers\SmsController;
use Dev\Sms\Http\Controllers\SmsLogController;
use Dev\Sms\Http\Middleware\EnsurePhoneIsVerified;
use Dev\Sms\Http\Middleware\RedirectIfPhoneIsVerified;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::prefix('sms')->name('sms.')->group(function () {
        Route::group(['prefix' => 'gateways', 'as' => 'gateways.', 'permissions' => 'sms-gateway.index'], function () {
            Route::get('/', [SmsController::class, 'index'])->name('index');

            Route::middleware(DisableInDemoModeMiddleware::class)->group(function () {
                Route::put('/', [SmsController::class, 'update'])->name('settings');
                Route::post('test', [SmsController::class, 'test'])->name('test');
                Route::post('{driver}', [SmsController::class, 'updateGateway'])->name('update');
                Route::post('{driver}/change-status', [SmsController::class, 'changeStatus'])->name('change-status');
            });
        });

        Route::group(['prefix' => 'logs', 'as' => 'logs.', 'permissions' => 'sms-gateway.logs'], function () {
            Route::match(['GET', 'POST'], '/', [SmsLogController::class, 'index'])->name('index');
            Route::get('{id}', [SmsLogController::class, 'show'])->name('show');
            Route::delete('{id}', [SmsLogController::class, 'destroy'])->name('destroy');
        });
    });
});

if (setting('fob_otp_guard')) {
    Theme::registerRoutes(function () {
        Route::prefix('otp')
            ->name('otp.')
            ->middleware([Guard::getGuard(), RedirectIfPhoneIsVerified::class])
            ->withoutMiddleware(EnsurePhoneIsVerified::class)
            ->group(function () {
                Route::get('verify', [PhoneVerificationController::class, 'index'])->name('verify');
                Route::post('verify', [PhoneVerificationController::class, 'store']);
                Route::post('resend', ResendOtpController::class)->name('resend');
            });
    });
}
