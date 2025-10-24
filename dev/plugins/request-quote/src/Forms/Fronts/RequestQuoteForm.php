<?php

namespace Dev\RequestQuote\Forms\Fronts;

use Dev\Base\Facades\BaseHelper;
use Dev\Base\Forms\FieldOptions\EmailFieldOption;
use Dev\Base\Forms\FieldOptions\HiddenFieldOption;
use Dev\Base\Forms\FieldOptions\HtmlFieldOption;
use Dev\Base\Forms\FieldOptions\NumberFieldOption;
use Dev\Base\Forms\FieldOptions\TextareaFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\EmailField;
use Dev\Base\Forms\Fields\HiddenField;
use Dev\Base\Forms\Fields\HtmlField;
use Dev\Base\Forms\Fields\NumberField;
use Dev\Base\Forms\Fields\TextareaField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Base\Forms\FormAbstract;
use Dev\Theme\FormFront;
use Dev\RequestQuote\Http\Requests\RequestQuoteRequest;
use Dev\RequestQuote\Models\RequestQuote;

class RequestQuoteForm extends FormFront
{
    protected string $errorBag = 'request_quote';

    public static function formTitle(): string
    {
        return trans('plugins/request-quote::request-quote.modal_title');
    }

    public function setup(): void
    {
        $this
            ->contentOnly()
            ->setUrl(route('public.request-quote.submit'))
            ->setFormOption('id', 'requestQuoteForm')
            ->setFormOption('class', 'request-quote-form')
            ->setValidatorClass(RequestQuoteRequest::class)
            ->model(RequestQuote::class)
            ->add(
                'product_id',
                HiddenField::class,
                HiddenFieldOption::make()
                    ->value('')
                    ->addAttribute('id', 'quote_product_id')
            )
            ->add(
                'product_display',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(
                        '<div class="mb-3">
                            <p class="text-muted mb-3">
                                <strong>' . trans('plugins/request-quote::request-quote.product') . ':</strong>
                                <span id="quote_product_name">-</span>
                                <br><small class="text-muted">' . trans('plugins/request-quote::request-quote.sku') . ': <span id="quote_product_sku">-</span></small>
                            </p>
                        </div>'
                    )
            )
            ->add('row_start_1', HtmlField::class, HtmlFieldOption::make()->content('<div class="row">'))
            ->add('col_start_1', HtmlField::class, HtmlFieldOption::make()->content('<div class="col-md-6 mb-3">'))
            ->add(
                'name',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.name'))
                    ->required()
                    ->cssClass('form-control')
                    ->labelAttributes(['class' => 'form-label required'])
                    ->placeholder(trans('plugins/request-quote::request-quote.name_placeholder'))
                    ->addAttribute('id', 'quote_name')
                    ->wrapperAttributes(false)
            )
            ->add('col_end_1', HtmlField::class, HtmlFieldOption::make()->content('</div>'))
            ->add('col_start_2', HtmlField::class, HtmlFieldOption::make()->content('<div class="col-md-6 mb-3">'))
            ->add(
                'email',
                EmailField::class,
                EmailFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.email_address'))
                    ->required()
                    ->cssClass('form-control')
                    ->labelAttributes(['class' => 'form-label required'])
                    ->placeholder(trans('plugins/request-quote::request-quote.email_placeholder'))
                    ->addAttribute('id', 'quote_email')
                    ->wrapperAttributes(false)
            )
            ->add('col_end_2', HtmlField::class, HtmlFieldOption::make()->content('</div>'))
            ->add('row_end_1', HtmlField::class, HtmlFieldOption::make()->content('</div>'))
            ->add('row_start_2', HtmlField::class, HtmlFieldOption::make()->content('<div class="row">'))
            ->add('col_start_3', HtmlField::class, HtmlFieldOption::make()->content('<div class="col-md-6 mb-3">'))
            ->add(
                'phone',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.phone'))
                    ->cssClass('form-control')
                    ->labelAttributes(['class' => 'form-label'])
                    ->placeholder(trans('plugins/request-quote::request-quote.phone_placeholder'))
                    ->addAttribute('id', 'quote_phone')
                    ->addAttribute('type', 'tel')
                    ->wrapperAttributes(false)
            )
            ->add('col_end_3', HtmlField::class, HtmlFieldOption::make()->content('</div>'))
            ->add('col_start_4', HtmlField::class, HtmlFieldOption::make()->content('<div class="col-md-6 mb-3">'))
            ->add(
                'company',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.company'))
                    ->cssClass('form-control')
                    ->labelAttributes(['class' => 'form-label'])
                    ->placeholder(trans('plugins/request-quote::request-quote.company_placeholder'))
                    ->addAttribute('id', 'quote_company')
                    ->wrapperAttributes(false)
            )
            ->add('col_end_4', HtmlField::class, HtmlFieldOption::make()->content('</div>'))
            ->add('row_end_2', HtmlField::class, HtmlFieldOption::make()->content('</div>'))
            ->add('quantity_wrapper_start', HtmlField::class, HtmlFieldOption::make()->content('<div class="mb-3">'))
            ->add(
                'quantity',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.quantity'))
                    ->required()
                    ->cssClass('form-control')
                    ->labelAttributes(['class' => 'form-label required'])
                    ->placeholder(trans('plugins/request-quote::request-quote.quantity_placeholder'))
                    ->addAttribute('id', 'quote_quantity')
                    ->addAttribute('min', '1')
                    ->value(1)
                    ->wrapperAttributes(false)
            )
            ->add('quantity_wrapper_end', HtmlField::class, HtmlFieldOption::make()->content('</div>'))
            ->add('message_wrapper_start', HtmlField::class, HtmlFieldOption::make()->content('<div class="mb-3">'))
            ->add(
                'message',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(trans('plugins/request-quote::request-quote.message'))
                    ->cssClass('form-control')
                    ->labelAttributes(['class' => 'form-label'])
                    ->addAttribute('id', 'quote_message')
                    ->rows(3)
                    ->placeholder(trans('plugins/request-quote::request-quote.message_placeholder'))
                    ->wrapperAttributes(false)
            )
            ->add('message_wrapper_end', HtmlField::class, HtmlFieldOption::make()->content('</div>'))
            ->add(
                'messages',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(
                        '<div class="alert alert-info d-none" id="quoteSuccessMessage">' .
                        trans('plugins/request-quote::request-quote.success_message') .
                        '</div>
                        <div class="alert alert-danger d-none" id="quoteErrorMessage"></div>'
                    )
            )
            ->when(setting('request_quote_show_form_info', false) && setting('request_quote_form_info_content'), function (FormAbstract $form) {
                $form
                    ->add(
                        'form_info',
                        HtmlField::class,
                        HtmlFieldOption::make()
                            ->content(BaseHelper::clean(setting('request_quote_form_info_content')))
                    );
            });
    }
}
