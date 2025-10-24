<?php

namespace Dev\Theme\Http\Requests;

use Dev\Base\Rules\OnOffRule;
use Dev\Support\Http\Requests\Request;
use Dev\Theme\Rules\GoogleTrackingIdRule;

class WebsiteTrackingSettingRequest extends Request
{
    public function rules(): array
    {
        $type = $this->input('google_tag_manager_type');

        $rules = [
            'google_tag_manager_type' => ['nullable', 'in:gtm,id,custom,code'], // 'code' for backwards compatibility
            'google_tag_manager_code' => ['nullable', 'string', 'max:10000'], // Keep for backwards compatibility
            'custom_tracking_header_js' => ['nullable', 'string', 'max:10000'],
            'custom_tracking_body_html' => ['nullable', 'string', 'max:10000'],
            'gtm_debug_mode' => new OnOffRule(),
        ];

        if ($type === 'gtm') {
            $rules['gtm_container_id'] = ['nullable', 'required_if:google_tag_manager_type,gtm', 'string', 'max:255', new GoogleTrackingIdRule('gtm')];
        } else {
            $rules['gtm_container_id'] = ['nullable', 'string', 'max:255'];
        }

        if ($type === 'id') {
            $rules['google_tag_manager_id'] = ['nullable', 'required_if:google_tag_manager_type,id', 'string', 'max:255', new GoogleTrackingIdRule('ga4')];
        } else {
            $rules['google_tag_manager_id'] = ['nullable', 'string', 'max:255'];
        }

        return $rules;
    }
}
