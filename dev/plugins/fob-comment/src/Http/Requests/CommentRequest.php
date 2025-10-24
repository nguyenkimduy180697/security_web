<?php

namespace Dev\Comment\Http\Requests;

use Dev\Base\Rules\EmailRule;
use Dev\Support\Http\Requests\Request;
use Dev\Comment\Enums\CommentStatus;
use Dev\Comment\Support\CommentHelper;
use Illuminate\Validation\Rule;

class CommentRequest extends Request
{
    public function rules(): array
    {
        $emailRules = CommentHelper::isEmailOptional()
            ? ['nullable', new EmailRule(), 'max:120']
            : ['required', new EmailRule(), 'max:120'];

        return [
            'content' => ['required', 'string', 'max:1000'],
            'name' => ['required', 'string', 'min:3', 'max:120'],
            'email' => $emailRules,
            'website' => ['nullable', 'url', 'max:255'],
            'status' => ['required', Rule::in(CommentStatus::values())],
        ];
    }
}
