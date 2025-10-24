<?php

namespace Dev\Pwa\Http\Controllers\Settings;

use Dev\Base\Http\Controllers\BaseController;
use Dev\Base\Http\Responses\BaseHttpResponse;
use Dev\Setting\Facades\Setting;
use Dev\Pwa\Forms\PwaSettingForm;
use Dev\Pwa\Http\Requests\PwaSettingRequest;
use Dev\Pwa\Listeners\PublishPwaAssets;

class PwaSettingController extends BaseController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/pwa::pwa.settings.title'));

        return PwaSettingForm::create()->renderForm();
    }

    public function update(PwaSettingRequest $request, BaseHttpResponse $response)
    {
        $data = $request->validated();

        foreach ($data as $key => $value) {
            Setting::set('pwa_' . $key, $value);
        }

        Setting::save();

        (new PublishPwaAssets())->generatePwaIcons();
        (new PublishPwaAssets())->publishPwaAssets();

        return $response
            ->setPreviousUrl(route('pwa.settings'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }
}
