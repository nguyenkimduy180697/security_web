<?php

namespace Dev\GoogleMapsGeocoding\Http\Controllers\Settings;

use Dev\Setting\Http\Controllers\SettingController;
use Dev\GoogleMapsGeocoding\Forms\Settings\GoogleMapsGeocodingSettingForm;
use Dev\GoogleMapsGeocoding\Http\Requests\Settings\GoogleMapsGeocodingSettingRequest;

class GoogleMapsGeocodingSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/google-maps-geocoding::geocoding.settings.title'));

        return GoogleMapsGeocodingSettingForm::create()->renderForm();
    }

    public function update(GoogleMapsGeocodingSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
