<?php

namespace Dev\Sms\Http\Requests;

use Dev\Base\Rules\OnOffRule;
use Dev\Support\Http\Requests\Request;
use Dev\Sms\Facades\Guard;
use Dev\Sms\Facades\Sms;
use Illuminate\Validation\Rule;

class SmsSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'sms_default_driver' => [
                'required',
                'string',
                Rule::in(array_keys(Sms::getProviders(activated: true))),
            ],
            'fob_otp_guard' => ['required', Rule::in(Guard::getGuards())],
            'fob_otp_expires_in' => [Rule::requiredIf(fn () => Guard::getGuard()), 'numeric', 'min:1'],
            'fob_otp_phone_verification_enabled' => [new OnOffRule()],
            'fob_otp_requires_phone_verification' => [new OnOffRule()],
            'fob_otp_message' => [Rule::requiredIf(fn () => Guard::getGuard()), 'string'],
        ];
    }
}
