<?php

namespace Dev\Analytics\Http\Controllers\Settings;

use Dev\Analytics\Forms\AnalyticsSettingForm;
use Dev\Analytics\Http\Requests\Settings\AnalyticsSettingRequest;
use Dev\Base\Http\Responses\BaseHttpResponse;
use Dev\Base\Supports\Breadcrumb;
use Dev\Setting\Http\Controllers\SettingController;

class AnalyticsSettingController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('core/base::base.panel.others'));
    }

    public function edit()
    {
        $this->pageTitle(trans('plugins/analytics::analytics.settings.title'));

        return AnalyticsSettingForm::create()->renderForm();
    }

    public function update(AnalyticsSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
