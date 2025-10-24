<?php

return [
    'common' => [
        'name' => 'Naam',
        'email' => 'E-mail',
        'website' => 'Website',
        'comment' => 'Reactie',
        'email_placeholder' => 'Je e-mailadres wordt niet gepubliceerd.',
        'website_placeholder' => 'bijv. https://example.com',
    ],

    'title' => 'Reacties',
    'author' => 'Auteur',
    'responsed_to' => 'Reactie op',
    'permalink' => 'Permalink',
    'url' => 'URL',
    'submitted_on' => 'Ingediend op',
    'edit_comment' => 'Reactie bewerken',
    'reply' => 'Beantwoorden',
    'in_reply_to' => 'Als antwoord op :name',

    'reply_modal' => [
        'title' => 'Antwoord op :comment',
        'cancel' => 'Annuleren',
    ],

    'allow_comments' => 'Reacties toestaan',

    'front' => [
        'admin_badge' => 'Beheerder',

        'list' => [
            'title' => ':count reactie|:count reacties',
            'reply' => 'Beantwoorden',
            'reply_to' => 'Antwoord aan :name',
            'cancel_reply' => 'Antwoord annuleren',
            'waiting_for_approval_message' => 'Je reactie wacht op goedkeuring. Dit is een voorbeeld, je reactie wordt zichtbaar na goedkeuring.',
        ],

        'form' => [
            'title' => 'Laat een reactie achter',
            'description' => 'Je e-mailadres wordt niet gepubliceerd. Verplichte velden zijn gemarkeerd met *',
            'cookie_consent' => 'Bewaar mijn naam, e-mail en website in deze browser voor de volgende keer wanneer ik een reactie plaats.',
            'submit' => 'Reactie plaatsen',
        ],

        'comment_success_message' => 'Je reactie is succesvol verzonden.',
    ],

    'enums' => [
        'statuses' => [
            'pending' => 'In afwachting',
            'approved' => 'Goedgekeurd',
            'spam' => 'Spam',
            'trash' => 'Prullenbak',
        ],
    ],

    'settings' => [
        'title' => 'Comment',
        'description' => 'Configureer instellingen voor Comment',

        'form' => [
            'enable_recaptcha' => 'reCAPTCHA inschakelen',
            'enable_recaptcha_help' => 'Je moet reCAPTCHA inschakelen in :url om deze functie te gebruiken.',
            'captcha_setting_label' => 'Captcha-instellingen',
            'comment_moderation' => 'Reacties moeten handmatig worden goedgekeurd',
            'comment_moderation_help' => 'Alle reacties moeten handmatig door een beheerder worden goedgekeurd voordat ze op de frontend worden weergegeven.',
            'show_comment_cookie_consent' => 'Toon cookie-checkbox voor reacties, zodat bezoekers hun informatie in de browser kunnen opslaan',
            'auto_fill_comment_form' => 'Automatisch reactiegegevens invullen voor ingelogde gebruikers',
            'auto_fill_comment_form_help' => 'Het reactieformulier wordt automatisch ingevuld met gebruikersgegevens zoals volledige naam, e-mail, enz., als ze zijn ingelogd.',
            'comment_order' => 'Sorteer reacties op',
            'comment_order_help' => 'Kies de gewenste volgorde voor het weergeven van reacties in de lijst.',
            'comment_order_choices' => [
                'asc' => 'Oudste',
                'desc' => 'Nieuwste',
            ],
            'display_admin_badge' => 'Beheerderbadge weergeven voor beheerdersreacties',
            'show_admin_role_name_for_admin_badge' => 'Toon beheerdersrolnaam voor beheerderbadge',
            'show_admin_role_name_for_admin_badge_helper' => 'Indien ingeschakeld, zal de beheerderbadge de naam van de beheerdersrol weergeven in plaats van de standaardtekst "Beheerder". Als de beheerdersrolnaam leeg is, wordt de standaardtekst gebruikt. Als de gebruiker meerdere rollen heeft, wordt de eerste rol gebruikt.',
            'default_avatar' => 'Standaard avatar',
            'default_avatar_helper' => 'Standaard avatar voor de auteur wanneer ze geen avatar hebben. Als je geen afbeelding selecteert, wordt deze gegenereerd met Gravatar. Afbeeldingsgrootte moet 150x150px zijn.',
        ],
    ],
];