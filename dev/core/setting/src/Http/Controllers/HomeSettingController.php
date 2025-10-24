<?php

namespace Dev\Setting\Http\Controllers;

use Dev\Base\Http\Controllers\BaseController;
use Illuminate\Contracts\View\View;

class HomeSettingController extends BaseController
{
    public function index(): View
    {
        $this->pageTitle(trans('core/setting::setting.title'));

        return view('core/setting::index');
    }
}
