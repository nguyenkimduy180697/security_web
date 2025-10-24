<?php

namespace Dev\Base\Http\Controllers;

use Dev\Base\Facades\BaseHelper;
use Dev\Setting\Facades\Setting;
use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Symfony\Component\Process\PhpExecutableFinder;

class CronjobSettingController extends BaseSystemController
{
    public function index(): View
    {
        $this->pageTitle(trans('core/setting::setting.cronjob.name'));

        $phpPath = (new PhpExecutableFinder())->find(false);

        $command = sprintf(
            '* * * * * %s %s/artisan schedule:run >> /dev/null 2>&1',
            $phpPath ?: 'php',
            BaseHelper::hasDemoModeEnabled() ? 'path-to-your-project' : base_path()
        );

        $lastRunAt = Setting::get('cronjob_last_run_at');

        if ($lastRunAt) {
            $lastRunAt = Carbon::parse($lastRunAt);
        }

        return view('core/setting::cronjob', compact('command', 'lastRunAt'));
    }
}
