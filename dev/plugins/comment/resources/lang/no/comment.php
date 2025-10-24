<?php

return [
    'common' => [
        'name' => 'Navn',
        'email' => 'E-post',
        'website' => 'Nettsted',
        'comment' => 'Kommentar',
        'email_placeholder' => 'E-postadressen din vil ikke bli publisert.',
        'website_placeholder' => 'f.eks. https://example.com',
    ],

    'title' => 'Kommentarer',
    'author' => 'Forfatter',
    'responsed_to' => 'Svar til',
    'permalink' => 'Permalenke',
    'url' => 'URL',
    'submitted_on' => 'Sendt inn',
    'edit_comment' => 'Rediger kommentar',
    'reply' => 'Svar',
    'in_reply_to' => 'Som svar til :name',

    'reply_modal' => [
        'title' => 'Svar på :comment',
        'cancel' => 'Avbryt',
    ],

    'allow_comments' => 'Tillat kommentarer',

    'front' => [
        'admin_badge' => 'Admin',

        'list' => [
            'title' => ':count kommentar|:count kommentarer',
            'reply' => 'Svar',
            'reply_to' => 'Svar til :name',
            'cancel_reply' => 'Avbryt svar',
            'waiting_for_approval_message' => 'Kommentaren din venter på godkjenning. Dette er en forhåndsvisning, kommentaren din vil være synlig etter godkjenning.',
        ],

        'form' => [
            'title' => 'Legg igjen en kommentar',
            'description' => 'E-postadressen din vil ikke bli publisert. Obligatoriske felt er merket *',
            'cookie_consent' => 'Lagre navn, e-post og nettsted i denne nettleseren til neste gang jeg kommenterer.',
            'submit' => 'Send kommentar',
        ],

        'comment_success_message' => 'Kommentaren din har blitt sendt.',
    ],

    'enums' => [
        'statuses' => [
            'pending' => 'Venter',
            'approved' => 'Godkjent',
            'spam' => 'Spam',
            'trash' => 'Papirkurv',
        ],
    ],

    'settings' => [
        'title' => 'Comment',
        'description' => 'Konfigurer innstillinger for Comment',

        'form' => [
            'enable_recaptcha' => 'Aktiver reCAPTCHA',
            'enable_recaptcha_help' => 'Du må aktivere reCAPTCHA i :url for å bruke denne funksjonen.',
            'captcha_setting_label' => 'Captcha-innstillinger',
            'comment_moderation' => 'Kommentarer må godkjennes manuelt',
            'comment_moderation_help' => 'Alle kommentarer må godkjennes manuelt av en administrator før de vises på nettsiden.',
            'show_comment_cookie_consent' => 'Vis avkrysningsboks for kommentarinformasjonskapsler, slik at besøkende kan lagre informasjonen sin i nettleseren',
            'auto_fill_comment_form' => 'Autofyll kommentardata for innloggede brukere',
            'auto_fill_comment_form_help' => 'Kommentarskjemaet fylles automatisk ut med brukerdata som fullt navn, e-post osv. hvis de er logget inn.',
            'comment_order' => 'Sorter kommentarer etter',
            'comment_order_help' => 'Velg foretrukket rekkefølge for å vise kommentarer i listen.',
            'comment_order_choices' => [
                'asc' => 'Eldste',
                'desc' => 'Nyeste',
            ],
            'display_admin_badge' => 'Vis administratormerke for administratorkommentarer',
            'show_admin_role_name_for_admin_badge' => 'Vis administratorrollenavn for administratormerket',
            'show_admin_role_name_for_admin_badge_helper' => 'Hvis aktivert, vil administratormerket vise administratorrollenavnet i stedet for standardteksten "Admin". Hvis administratorrollenavnet er tomt, brukes standardteksten. Hvis brukeren har flere roller, brukes den første rollen.',
            'default_avatar' => 'Standard avatar',
            'default_avatar_helper' => 'Standard avatar for forfatteren når de ikke har en avatar. Hvis du ikke velger noe bilde, genereres det ved hjelp av Gravatar. Bildestørrelsen bør være 150x150px.',
        ],
    ],
];