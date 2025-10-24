<?php

return [
    'name' => 'plugins/request-quote::request-quote.email.title',
    'description' => 'plugins/request-quote::request-quote.email.description',
    'templates' => [
        'admin-notification' => [
            'title' => 'plugins/request-quote::request-quote.email.templates.admin_notification_title',
            'description' => 'plugins/request-quote::request-quote.email.templates.admin_notification_description',
            'subject' => 'plugins/request-quote::request-quote.email.templates.admin_notification_subject',
            'can_off' => true,
            'enabled' => true,
            'variables' => [
                'quote_name' => 'plugins/request-quote::request-quote.email.templates.quote_name',
                'quote_email' => 'plugins/request-quote::request-quote.email.templates.quote_email',
                'quote_phone' => 'plugins/request-quote::request-quote.email.templates.quote_phone',
                'quote_company' => 'plugins/request-quote::request-quote.email.templates.quote_company',
                'quote_quantity' => 'plugins/request-quote::request-quote.email.templates.quote_quantity',
                'quote_message' => 'plugins/request-quote::request-quote.email.templates.quote_message',
                'product_name' => 'plugins/request-quote::request-quote.email.templates.product_name',
                'product_sku' => 'plugins/request-quote::request-quote.email.templates.product_sku',
                'product_url' => 'plugins/request-quote::request-quote.email.templates.product_url',
                'admin_link' => 'plugins/request-quote::request-quote.email.templates.admin_link',
                'site_title' => 'plugins/request-quote::request-quote.email.templates.site_title',
            ],
        ],
        'customer-confirmation' => [
            'title' => 'plugins/request-quote::request-quote.email.templates.customer_confirmation_title',
            'description' => 'plugins/request-quote::request-quote.email.templates.customer_confirmation_description',
            'subject' => 'plugins/request-quote::request-quote.email.templates.customer_confirmation_subject',
            'can_off' => true,
            'enabled' => true,
            'variables' => [
                'quote_name' => 'plugins/request-quote::request-quote.email.templates.quote_name',
                'quote_email' => 'plugins/request-quote::request-quote.email.templates.quote_email',
                'quote_phone' => 'plugins/request-quote::request-quote.email.templates.quote_phone',
                'quote_company' => 'plugins/request-quote::request-quote.email.templates.quote_company',
                'quote_quantity' => 'plugins/request-quote::request-quote.email.templates.quote_quantity',
                'quote_message' => 'plugins/request-quote::request-quote.email.templates.quote_message',
                'product_name' => 'plugins/request-quote::request-quote.email.templates.product_name',
                'product_sku' => 'plugins/request-quote::request-quote.email.templates.product_sku',
                'site_title' => 'plugins/request-quote::request-quote.email.templates.site_title',
            ],
        ],
    ],
];