<?php

declare(strict_types=1);

namespace Dev\EmailLog\Forms;

use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\TextField;
use Dev\Base\Forms\FormAbstract;

class EmailLogForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->contentOnly()
            ->columns(3)
            ->add(
                'created_at',
                TextField::class,
                TextFieldOption::make()->label(trans('core/base::tables.created_at'))->disabled()->toArray()
            )
            ->add(
                'from',
                TextField::class,
                TextFieldOption::make()->label(trans('plugins/email-log::email-log.from'))->disabled()->toArray()
            )
            ->add(
                'to',
                TextField::class,
                TextFieldOption::make()->label(trans('plugins/email-log::email-log.to'))->disabled()->toArray()
            )
            ->when($this->model->cc, function (FormAbstract $form) {
                $form->add(
                    'cc',
                    TextField::class,
                    TextFieldOption::make()->label(trans('plugins/email-log::email-log.cc'))->disabled()->toArray()
                );
            })
            ->when($this->model->bcc, function (FormAbstract $form) {
                $form->add(
                    'bcc',
                    TextField::class,
                    TextFieldOption::make()->label(trans('plugins/email-log::email-log.bcc'))->disabled()->toArray()
                );
            })
            ->add(
                'subject',
                TextField::class,
                TextFieldOption::make()->label(trans('plugins/email-log::email-log.subject'))->disabled()->toArray()
            );
    }
}
