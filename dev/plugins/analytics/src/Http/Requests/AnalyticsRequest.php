<?php

namespace Dev\Analytics\Http\Requests;

use Dev\Support\Http\Requests\Request;

class AnalyticsRequest extends Request
{
    public function rules(): array
    {
        return [
            'predefined_range' => ['nullable', 'string'],
            'changed_predefined_range' => ['nullable', 'boolean'],
        ];
    }
}
