<?php

namespace Dev\Member\Http\Requests;

use Dev\Support\Http\Requests\Request;

class UpdatePasswordRequest extends Request
{
    public function rules(): array
    {
        return [
            'old_password' => ['required', 'string', 'min:6', 'current_password:member'],
            'password' => ['required', 'string', 'min:6', 'max:60', 'confirmed', 'different:old_password'],
        ];
    }
}
