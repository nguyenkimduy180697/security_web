<?php

return [
    'common' => [
        'name' => 'Namn',
        'email' => 'E-post',
        'website' => 'Webbplats',
        'comment' => 'Kommentar',
        'email_placeholder' => 'Din e-postadress publiceras inte.',
        'website_placeholder' => 't.ex. https://example.com',
    ],

    'title' => 'Kommentarer',
    'author' => 'Författare',
    'responsed_to' => 'Svar till',
    'permalink' => 'Permalänk',
    'url' => 'URL',
    'submitted_on' => 'Inskickad',
    'edit_comment' => 'Redigera kommentar',
    'reply' => 'Svara',
    'in_reply_to' => 'Som svar till :name',

    'reply_modal' => [
        'title' => 'Svara på :comment',
        'cancel' => 'Avbryt',
    ],

    'allow_comments' => 'Tillåt kommentarer',

    'front' => [
        'admin_badge' => 'Admin',

        'list' => [
            'title' => ':count kommentar|:count kommentarer',
            'reply' => 'Svara',
            'reply_to' => 'Svara :name',
            'cancel_reply' => 'Avbryt svar',
            'waiting_for_approval_message' => 'Din kommentar väntar på godkännande. Detta är en förhandsgranskning, din kommentar kommer att synas efter godkännande.',
        ],

        'form' => [
            'title' => 'Lämna en kommentar',
            'description' => 'Din e-postadress publiceras inte. Obligatoriska fält är märkta *',
            'cookie_consent' => 'Spara mitt namn, e-post och webbplats i denna webbläsare till nästa gång jag kommenterar.',
            'submit' => 'Skicka kommentar',
        ],

        'comment_success_message' => 'Din kommentar har skickats.',
    ],

    'enums' => [
        'statuses' => [
            'pending' => 'Väntar',
            'approved' => 'Godkänd',
            'spam' => 'Spam',
            'trash' => 'Papperskorg',
        ],
    ],

    'settings' => [
        'title' => 'Comment',
        'description' => 'Konfigurera inställningar för Comment',

        'form' => [
            'enable_recaptcha' => 'Aktivera reCAPTCHA',
            'enable_recaptcha_help' => 'Du måste aktivera reCAPTCHA i :url för att använda denna funktion.',
            'captcha_setting_label' => 'Captcha-inställningar',
            'comment_moderation' => 'Kommentarer måste godkännas manuellt',
            'comment_moderation_help' => 'Alla kommentarer måste godkännas manuellt av en administratör innan de visas på webbplatsen.',
            'show_comment_cookie_consent' => 'Visa kryssruta för kommentarscookies, vilket låter besökare spara sin information i webbläsaren',
            'auto_fill_comment_form' => 'Fyll i kommentarsdata automatiskt för inloggade användare',
            'auto_fill_comment_form_help' => 'Kommentarsformuläret fylls i automatiskt med användardata som fullständigt namn, e-post etc. om de är inloggade.',
            'comment_order' => 'Sortera kommentarer efter',
            'comment_order_help' => 'Välj önskad ordning för att visa kommentarer i listan.',
            'comment_order_choices' => [
                'asc' => 'Äldsta',
                'desc' => 'Nyaste',
            ],
            'display_admin_badge' => 'Visa administratörsmärke för administratörskommentarer',
            'show_admin_role_name_for_admin_badge' => 'Visa administratörsrollnamn för administratörsmärket',
            'show_admin_role_name_for_admin_badge_helper' => 'Om aktiverat kommer administratörsmärket att visa administratörsrollnamnet istället för standardtexten "Admin". Om administratörsrollnamnet är tomt används standardtexten. Om användaren har flera roller används den första rollen.',
            'default_avatar' => 'Standardavatar',
            'default_avatar_helper' => 'Standardavatar för författaren när de inte har en avatar. Om du inte väljer någon bild genereras den med Gravatar. Bildstorleken bör vara 150x150px.',
        ],
    ],
];