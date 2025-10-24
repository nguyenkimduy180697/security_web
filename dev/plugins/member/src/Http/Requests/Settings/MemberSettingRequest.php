<?php

namespace Dev\Member\Http\Requests\Settings;

use Dev\Base\Rules\MediaImageRule;
use Dev\Base\Rules\OnOffRule;
use Dev\Support\Http\Requests\Request;

class MemberSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'member_enabled_login' => [$onOffRule = new OnOffRule()],
            'member_enabled_registration' => [$onOffRule],
            'verify_account_email' => [$onOffRule],
            'member_verification_expire_minutes' => ['nullable', 'integer', 'min:1', 'max:10080'],
            'member_enable_post_approval' => [$onOffRule],
            'member_show_terms_checkbox' => [$onOffRule],
            'member_default_avatar' => ['nullable', new MediaImageRule()],
        ];
    }
}
