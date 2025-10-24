<?php

namespace Dev\Blog\Widgets\Fronts;

use Dev\Base\Forms\FieldOptions\NameFieldOption;
use Dev\Base\Forms\FieldOptions\NumberFieldOption;
use Dev\Base\Forms\Fields\NumberField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Widget\AbstractWidget;
use Dev\Widget\Forms\WidgetForm;
use Illuminate\Support\Collection;

class Tags extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => trans('plugins/blog::posts.widget_tags'),
            'description' => trans('plugins/blog::posts.widget_tags_description'),
            'number_display' => 5,
        ]);
    }

    protected function data(): array|Collection
    {
        return [
            'tags' => get_popular_tags((int) $this->getConfig('number_display')),
        ];
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('name', TextField::class, NameFieldOption::make())
            ->add(
                'number_display',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(__('Number tags to display'))
            );
    }

    protected function requiredPlugins(): array
    {
        return ['blog'];
    }
}
