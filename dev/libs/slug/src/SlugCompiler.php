<?php

namespace Dev\Slug;

use Dev\Base\Models\BaseModel;
use Carbon\Carbon;

class SlugCompiler
{
    public function getVariables(): array
    {
        $now = Carbon::now();

        return apply_filters('cms_slug_variables', [
            '%%year%%' => [
                'label' => trans('libs/slug::slug.current_year'),
                'value' => $now->year,
            ],
            '%%month%%' => [
                'label' => trans('libs/slug::slug.current_month'),
                'value' => $now->month,
            ],
            '%%day%%' => [
                'label' => trans('libs/slug::slug.current_day'),
                'value' => $now->month,
            ],
        ]);
    }

    public function compile(?string $prefix, BaseModel|string|null $model = null): string
    {
        if (! $prefix) {
            return '';
        }

        foreach ($this->getVariables() as $key => $value) {
            $prefix = str_replace($key, $value['value'], $prefix);
        }

        return apply_filters('cms_slug_prefix', $prefix, $model);
    }
}
