<?php

namespace Dev\GeoDataDetector\Http\Controllers\Settings;

use Dev\GeoDataDetector\Forms\Settings\GeoDataDetectorSettingForm;
use Dev\GeoDataDetector\Http\Requests\Settings\GeoDataDetectorSettingRequest;
use Dev\Base\Http\Responses\BaseHttpResponse;
use Dev\Setting\Http\Controllers\SettingController;

class GeoDataDetectorSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/geo-data-detector::geo-data-detector.name'));

        return GeoDataDetectorSettingForm::create()->renderForm();
    }

    public function update(GeoDataDetectorSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
