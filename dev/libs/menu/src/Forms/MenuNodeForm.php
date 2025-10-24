<?php

namespace Dev\Menu\Forms;

use Dev\Base\Forms\FieldOptions\SelectFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\SelectField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Base\Forms\FormAbstract;
use Dev\Menu\Models\MenuNode;

class MenuNodeForm extends FormAbstract
{
    public function setup(): void
    {
        $this->model(MenuNode::class);

        $id = $this->model->id ?? 'new';

        $this
            ->contentOnly()
            ->add(
                'menu_id',
                'hidden',
                TextFieldOption::make()
                    ->value($this->request->route('menu'))
                    ->attributes(['class' => 'menu_id'])
            )
            ->add(
                'title',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('libs/menu::menu.title'))
                    ->labelAttributes([
                        'data-update' => 'title',
                        'for' => 'menu-node-title-' . $id,
                    ])
                    ->placeholder(trans('libs/menu::menu.title_placeholder'))
                    ->attributes([
                        'data-old' => $this->model->title,
                        'id' => 'menu-node-title-' . $id,
                    ])
            );

        if (! $this->model->reference_id) {
            $this
                ->add(
                    'url',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(trans('libs/menu::menu.url'))
                        ->labelAttributes([
                            'data-update' => 'custom-url',
                            'for' => 'menu-node-url-' . $id,
                        ])
                        ->placeholder(trans('libs/menu::menu.url_placeholder'))
                        ->attributes([
                            'data-old' => $this->model->url,
                            'id' => 'menu-node-url-' . $id,
                        ])
                );
        }

        $this
            ->add(
                'icon_font',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('libs/menu::menu.icon'))
                    ->labelAttributes([
                        'data-update' => 'icon',
                        'for' => 'menu-node-icon-font-' . $id,
                    ])
                    ->placeholder(trans('libs/menu::menu.icon_placeholder'))
                    ->attributes([
                        'data-old' => $this->model->icon_font,
                        'id' => 'menu-node-icon-font-' . $id,
                    ])
            )
            ->add(
                'css_class',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('libs/menu::menu.css_class'))
                    ->labelAttributes([
                        'data-update' => 'css_class',
                        'for' => 'menu-node-css-class-' . $id,
                    ])
                    ->placeholder(trans('libs/menu::menu.css_class_placeholder'))
                    ->attributes([
                        'data-old' => $this->model->css_class,
                        'id' => 'menu-node-css-class-' . $id,
                    ])
            )
            ->add(
                'target',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('libs/menu::menu.target'))
                    ->labelAttributes([
                        'data-update' => 'target',
                        'for' => 'menu-node-target-' . $id,
                    ])
                    ->choices([
                        '_self' => trans('libs/menu::menu.self_open_link'),
                        '_blank' => trans('libs/menu::menu.blank_open_link'),
                    ])
                    ->attributes([
                        'data-old' => $this->model->target,
                        'id' => 'menu-node-target-' . $id,
                    ])
            );
    }
}
