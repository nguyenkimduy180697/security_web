<?php

return [
    'common' => [
        'name' => 'Nombre',
        'email' => 'Correo electrónico',
        'website' => 'Sitio web',
        'comment' => 'Comentario',
        'email_placeholder' => 'Tu dirección de correo electrónico no será publicada.',
        'website_placeholder' => 'ej. https://example.com',
    ],

    'title' => 'Comentarios',
    'author' => 'Autor',
    'responsed_to' => 'Respuesta a',
    'permalink' => 'Enlace permanente',
    'url' => 'URL',
    'submitted_on' => 'Enviado el',
    'edit_comment' => 'Editar comentario',
    'reply' => 'Responder',
    'in_reply_to' => 'En respuesta a :name',

    'reply_modal' => [
        'title' => 'Responder a :comment',
        'cancel' => 'Cancelar',
    ],

    'allow_comments' => 'Permitir comentarios',

    'front' => [
        'admin_badge' => 'Admin',

        'list' => [
            'title' => ':count comentario|:count comentarios',
            'reply' => 'Responder',
            'reply_to' => 'Responder a :name',
            'cancel_reply' => 'Cancelar respuesta',
            'waiting_for_approval_message' => 'Tu comentario está esperando moderación. Esta es una vista previa, tu comentario será visible después de que haya sido aprobado.',
        ],

        'form' => [
            'title' => 'Deja un comentario',
            'description' => 'Tu dirección de correo electrónico no será publicada. Los campos obligatorios están marcados con *',
            'cookie_consent' => 'Guardar mi nombre, correo electrónico y sitio web en este navegador para la próxima vez que comente.',
            'submit' => 'Publicar comentario',
        ],

        'comment_success_message' => 'Tu comentario ha sido enviado exitosamente.',
    ],

    'enums' => [
        'statuses' => [
            'pending' => 'Pendiente',
            'approved' => 'Aprobado',
            'spam' => 'Spam',
            'trash' => 'Papelera',
        ],
    ],

    'settings' => [
        'title' => 'Comment',
        'description' => 'Configurar ajustes para Comment',

        'form' => [
            'enable_recaptcha' => 'Habilitar reCAPTCHA',
            'enable_recaptcha_help' => 'Necesitas habilitar reCAPTCHA en :url para usar esta función.',
            'captcha_setting_label' => 'Configuración de Captcha',
            'comment_moderation' => 'Los comentarios deben ser aprobados manualmente',
            'comment_moderation_help' => 'Todos los comentarios deben ser aprobados manualmente por un administrador antes de mostrarse en el frontend.',
            'show_comment_cookie_consent' => 'Mostrar casilla de cookies de comentarios, permitiendo a los visitantes guardar su información en el navegador',
            'auto_fill_comment_form' => 'Autocompletar datos de comentario para usuarios conectados',
            'auto_fill_comment_form_help' => 'El formulario de comentario se completará automáticamente con datos del usuario como nombre completo, correo electrónico, etc., si han iniciado sesión.',
            'comment_order' => 'Ordenar comentarios por',
            'comment_order_help' => 'Elige el orden preferido para mostrar comentarios en la lista.',
            'comment_order_choices' => [
                'asc' => 'Más antiguos',
                'desc' => 'Más recientes',
            ],
            'display_admin_badge' => 'Mostrar insignia de administrador para comentarios de administradores',
            'show_admin_role_name_for_admin_badge' => 'Mostrar nombre del rol de administrador para la insignia de administrador',
            'show_admin_role_name_for_admin_badge_helper' => 'Si está habilitado, la insignia de administrador mostrará el nombre del rol de administrador en lugar del texto predeterminado "Admin". Si el nombre del rol de administrador está vacío, se usará el texto predeterminado. Si el usuario tiene múltiples roles, se usará el primer rol.',
            'default_avatar' => 'Avatar predeterminado',
            'default_avatar_helper' => 'Avatar predeterminado para el autor cuando no tiene un avatar. Si no seleccionas ninguna imagen, se generará usando Gravatar. El tamaño de la imagen debe ser 150x150px.',
        ],
    ],
];