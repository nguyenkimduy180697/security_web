<?php

namespace Dev\Backup;

use Dev\PluginManagement\Abstracts\PluginOperationAbstract;
use Illuminate\Support\Facades\File;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        $backupPath = storage_path('app/backup');

        if (File::isDirectory($backupPath)) {
            File::deleteDirectory($backupPath);
        }
    }
}
