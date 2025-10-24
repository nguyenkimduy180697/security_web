<?php

namespace Dev\Menu\Widgets\Fronts;

use Dev\Base\Forms\FieldOptions\NameFieldOption;
use Dev\Base\Forms\FieldOptions\SelectFieldOption;
use Dev\Base\Forms\Fields\SelectField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Menu\Models\Menu;
use Dev\Widget\AbstractWidget;
use Dev\Widget\Forms\WidgetForm;

class CustomMenu extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => trans('libs/menu::menu.widget_custom_menu'),
            'description' => trans('libs/menu::menu.widget_custom_menu_description'),
            'menu_id' => null,
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('name', TextField::class, NameFieldOption::make())
            ->add(
                'menu_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('libs/menu::menu.select_menu'))
                    ->choices(Menu::query()->pluck('name', 'slug')->all())
                    ->searchable()
            );
    }
}
