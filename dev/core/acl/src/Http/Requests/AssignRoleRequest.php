<?php

namespace Dev\ACL\Http\Requests;

use Dev\Support\Http\Requests\Request;

class AssignRoleRequest extends Request
{
    public function rules(): array
    {
        return [
            'pk' => ['required', 'exists:users,id', 'min:1'],
            'value' => ['required', 'exists:roles,id', 'min:1'],
        ];
    }
}
