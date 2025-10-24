<?php

namespace Dev\Api\Http\Requests;

use Dev\Support\Http\Requests\Request;

class ResendEmailVerificationRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => ['required', 'email', 'string'],
        ];
    }

    public function bodyParameters(): array
    {
        return [
            'email' => [
                'description' => 'The email address to resend verification to',
                'example' => 'john.smith@example.com',
            ],
        ];
    }
}
