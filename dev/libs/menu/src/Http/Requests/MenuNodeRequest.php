<?php

namespace Dev\Menu\Http\Requests;

use Dev\Support\Http\Requests\Request;

class MenuNodeRequest extends Request
{
    public function rules(): array
    {
        return [
            'data' => ['required', 'array'],
            'data.menu_id' => ['required'],
        ];
    }

    public function attributes(): array
    {
        return [
            'data.menu_id' => trans('libs/menu::menu.menu_id'),
        ];
    }
}
