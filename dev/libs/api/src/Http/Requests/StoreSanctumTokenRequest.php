<?php

namespace Dev\Api\Http\Requests;

use Dev\Support\Http\Requests\Request;

class StoreSanctumTokenRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'abilities' => ['nullable', 'array'],
        ];
    }

    public function bodyParameters(): array
    {
        return [
            'name' => [
                'description' => 'The name of the token',
                'example' => 'My API Token',
            ],
            'abilities' => [
                'description' => 'The abilities/permissions for the token',
                'example' => ['read', 'write'],
            ],
        ];
    }
}
