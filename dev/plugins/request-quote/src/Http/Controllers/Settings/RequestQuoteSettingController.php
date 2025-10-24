<?php

namespace Dev\RequestQuote\Http\Controllers\Settings;

use Dev\Base\Http\Responses\BaseHttpResponse;
use Dev\Setting\Http\Controllers\SettingController;
use Dev\RequestQuote\Forms\Settings\RequestQuoteSettingForm;
use Dev\RequestQuote\Http\Requests\Settings\RequestQuoteSettingRequest;

class RequestQuoteSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/request-quote::request-quote.settings.title'));

        return RequestQuoteSettingForm::create()->renderForm();
    }

    public function update(RequestQuoteSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
