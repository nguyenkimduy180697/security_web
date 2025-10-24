<?php

namespace Dev\Sms\Http\Requests;

use Dev\Support\Http\Requests\Request;

class PhoneVerificationRequest extends Request
{
    public function rules(): array
    {
        return [
            'otp' => ['required', 'digits:6'],
        ];
    }
}
