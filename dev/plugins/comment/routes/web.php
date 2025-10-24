<?php

use Dev\Base\Facades\AdminHelper;
use Dev\Theme\Facades\Theme;
use Dev\Comment\Http\Controllers\CommentController;
use Dev\Comment\Http\Controllers\ReplyCommentController;
use Dev\Comment\Http\Controllers\Settings\CommentSettingController;
use Dev\Comment\Http\Controllers\Fronts\CommentController as FrontCommentController;
use Dev\Comment\Http\Controllers\Fronts\ReplyCommentController as FrontReplyCommentController;
use Illuminate\Support\Facades\Route;


Route::name('comment.')->group(function (): void {
    AdminHelper::registerRoutes(function (): void {
        Route::group(['prefix' => 'comments', 'as' => 'comments.'], function (): void {
            Route::resource('', CommentController::class)->parameters(['' => 'comment']);
            Route::post('{comment}/reply', [ReplyCommentController::class, '__invoke'])->name('reply');
        });

        Route::group(['prefix' => 'settings', 'permission' => 'comment.settings'], function (): void {
            Route::get('comment', [CommentSettingController::class, 'edit'])->name('settings');
            Route::put('comment', [CommentSettingController::class, 'update'])->name('settings.update');
        });
    });

    Theme::registerRoutes(function (): void {
        Route::prefix('comment')->name('public.comments.')->group(function (): void {
            Route::get('comments', [FrontCommentController::class, 'index'])->name('index');
            Route::post('comments', [FrontCommentController::class, 'store'])->name('store');
            Route::post('comments/{comment}/reply', FrontReplyCommentController::class)->name('reply');
        });
    });
});
