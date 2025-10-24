<?php

namespace Dev\Setting\Http\Requests;

use Dev\Base\Rules\OnOffRule;
use Dev\Support\Http\Requests\Request;

class EmailTemplateRequest extends Request
{
    public function rules(): array
    {
        return [
            'email_subject' => ['nullable', 'string', 'required_with:email_subject_key'],
            'email_content' => ['required', 'string', 'max:1000000'],
            'module' => ['required', 'string', 'alpha_dash'],
            'template_file' => ['required', 'string', 'alpha_dash'],
            'status' => [new OnOffRule()],
        ];
    }
}
