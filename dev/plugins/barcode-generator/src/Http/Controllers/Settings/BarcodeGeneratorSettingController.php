<?php

namespace Dev\BarcodeGenerator\Http\Controllers\Settings;

use Dev\Base\Http\Responses\BaseHttpResponse;
use Dev\Base\Supports\Breadcrumb;
use Dev\Setting\Http\Controllers\SettingController;
use Dev\BarcodeGenerator\Forms\Settings\BarcodeGeneratorSettingForm;
use Dev\BarcodeGenerator\Http\Requests\Settings\BarcodeGeneratorSettingRequest;

class BarcodeGeneratorSettingController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/barcode-generator::barcode-generator.settings.title'), route('barcode-generator.settings'));
    }

    public function edit()
    {
        $this->pageTitle(trans('plugins/barcode-generator::barcode-generator.settings.title'));

        return BarcodeGeneratorSettingForm::create()->renderForm();
    }

    public function update(BarcodeGeneratorSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
