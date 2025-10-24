<?php

return [
    'common' => [
        'name' => 'Nome',
        'email' => 'Email',
        'website' => 'Sito web',
        'comment' => 'Commento',
        'email_placeholder' => 'Il tuo indirizzo email non sarà pubblicato.',
        'website_placeholder' => 'es. https://example.com',
    ],

    'title' => 'Commenti',
    'author' => 'Autore',
    'responsed_to' => 'Risposta a',
    'permalink' => 'Permalink',
    'url' => 'URL',
    'submitted_on' => 'Inviato il',
    'edit_comment' => 'Modifica commento',
    'reply' => 'Rispondi',
    'in_reply_to' => 'In risposta a :name',

    'reply_modal' => [
        'title' => 'Rispondi a :comment',
        'cancel' => 'Annulla',
    ],

    'allow_comments' => 'Consenti commenti',

    'front' => [
        'admin_badge' => 'Admin',

        'list' => [
            'title' => ':count commento|:count commenti',
            'reply' => 'Rispondi',
            'reply_to' => 'Rispondi a :name',
            'cancel_reply' => 'Annulla risposta',
            'waiting_for_approval_message' => 'Il tuo commento è in attesa di moderazione. Questa è un\'anteprima, il tuo commento sarà visibile dopo l\'approvazione.',
        ],

        'form' => [
            'description_email_optional' => 'Your email address will not be published. Email is optional. Required fields are marked *',
            'title' => 'Lascia un commento',
            'description' => 'Il tuo indirizzo email non sarà pubblicato. I campi obbligatori sono contrassegnati con *',
            'cookie_consent' => 'Salva il mio nome, email e sito web in questo browser per il prossimo commento.',
            'submit' => 'Invia commento',
        ],

        'comment_success_message' => 'Il tuo commento è stato inviato con successo.',
    ],

    'enums' => [
        'statuses' => [
            'pending' => 'In attesa',
            'approved' => 'Approvato',
            'spam' => 'Spam',
            'trash' => 'Cestino',
        ],
    ],

    'settings' => [
        'title' => 'Comment',
        'description' => 'Configura le impostazioni per Comment',

        'form' => [
            'enable_recaptcha' => 'Abilita reCAPTCHA',
            'enable_recaptcha_help' => 'Devi abilitare reCAPTCHA in :url per utilizzare questa funzione.',
            'captcha_setting_label' => 'Impostazioni Captcha',
            'comment_moderation' => 'I commenti devono essere approvati manualmente',
            'comment_moderation_help' => 'Tutti i commenti devono essere approvati manualmente da un amministratore prima di essere visualizzati sul frontend.',
            'show_comment_cookie_consent' => 'Mostra la casella di controllo dei cookie dei commenti, consentendo ai visitatori di salvare le loro informazioni nel browser',
            'auto_fill_comment_form' => 'Compila automaticamente i dati del commento per gli utenti connessi',
            'auto_fill_comment_form_help' => 'Il modulo dei commenti verrà compilato automaticamente con i dati dell\'utente come nome completo, email, ecc., se sono connessi.',
            'comment_order' => 'Ordina i commenti per',
            'comment_order_help' => 'Scegli l\'ordine preferito per visualizzare i commenti nell\'elenco.',
            'comment_order_choices' => [
                'asc' => 'Più vecchi',
                'desc' => 'Più recenti',
            ],
            'display_admin_badge' => 'Mostra il badge admin per i commenti degli amministratori',
            'show_admin_role_name_for_admin_badge' => 'Mostra il nome del ruolo admin per il badge admin',
            'show_admin_role_name_for_admin_badge_helper' => 'Se abilitato, il badge admin mostrerà il nome del ruolo admin invece del testo predefinito "Admin". Se il nome del ruolo admin è vuoto, verrà utilizzato il testo predefinito. Se l\'utente ha più ruoli, verrà utilizzato il primo ruolo.',
            'default_avatar' => 'Avatar predefinito',
            'default_avatar_helper' => 'Avatar predefinito per l\'autore quando non ha un avatar. Se non selezioni alcuna immagine, verrà generata utilizzando Gravatar. La dimensione dell\'immagine dovrebbe essere 150x150px.',
        ],
    ],
];
