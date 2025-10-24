<?php

namespace Dev\Ticksify\Forms\Fronts;

use Dev\Base\Forms\FieldOptions\ButtonFieldOption;
use Dev\Base\Forms\FieldOptions\HtmlFieldOption;
use Dev\Base\Forms\FieldOptions\SelectFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\HtmlField;
use Dev\Base\Forms\Fields\SelectField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Theme\Facades\Theme;
use Dev\Theme\FormFront;
use Dev\Ticksify\Enums\TicketPriority;
use Dev\Ticksify\Http\Requests\Fronts\TicketRequest;
use Dev\Ticksify\Models\Category;
use Dev\Ticksify\Models\Ticket;

class TicketForm extends FormFront
{
    public function setup(): void
    {
        Theme::asset()
            ->container('footer')
            ->add('ticksify', 'vendor/core/plugins/ticksify/js/front-ticksify.js');

        $categories = Category::query()
            ->wherePublished()
            ->pluck('name', 'id')
            ->all();

        $this
            ->model(Ticket::class)
            ->contentOnly()
            ->setUrl(route('ticksify.public.tickets.store'))
            ->setValidatorClass(TicketRequest::class)
            ->add(
                'title',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Subject'))
                    ->placeholder(__('Briefly describe your issue'))
                    ->required()
            )
            ->add(
                'category_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Category'))
                    ->choices(['' => __('Uncategorized')] + $categories),
            )
            ->add(
                'trix-editor',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->label(__('Content'))
                    ->content('<trix-editor input="content"></trix-editor>')
                    ->required()
            )
            ->add(
                'content',
                'hidden',
                TextFieldOption::make()
                    ->addAttribute('id', 'content')
            )
            ->add(
                'priority',
                SelectField::class,
                SelectFieldOption::make()
                    ->wrapperAttributes(['class' => 'my-3 position-relative'])
                    ->label(__('Priority'))
                    ->choices(TicketPriority::labels())
                    ->defaultValue(TicketPriority::MEDIUM)
            )
            ->add(
                'submit',
                'submit',
                ButtonFieldOption::make()
                    ->cssClass('btn btn-primary mt-3')
                    ->label(__('Submit')),
            );
    }
}
