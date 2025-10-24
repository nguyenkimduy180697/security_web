<?php

namespace Dev\WordpressImporter\Http\Requests;

use Dev\Base\Rules\OnOffRule;
use Dev\Support\Http\Requests\Request;

class WordpressImporterRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'wpexport' => ['required', 'mimetypes:text/xml,application/xml'],
            'timeout' => ['integer'],
        ];

        if (is_plugin_active('blog')) {
            $rules['copy_categories'] = [new OnOffRule()];
            $rules['default_category_id'] = ['required_if:copy_categories,0'];
        }

        return $rules;
    }
}
