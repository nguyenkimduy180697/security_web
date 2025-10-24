<?php

return [
    'common' => [
        'name' => 'Nama',
        'email' => 'E-mel',
        'website' => 'Laman web',
        'comment' => 'Komen',
        'email_placeholder' => 'Alamat e-mel anda tidak akan diterbitkan.',
        'website_placeholder' => 'cth. https://example.com',
    ],

    'title' => 'Komen',
    'author' => 'Pengarang',
    'responsed_to' => 'Respons kepada',
    'permalink' => 'Pautan kekal',
    'url' => 'URL',
    'submitted_on' => 'Dihantar pada',
    'edit_comment' => 'Edit komen',
    'reply' => 'Balas',
    'in_reply_to' => 'Sebagai balasan kepada :name',

    'reply_modal' => [
        'title' => 'Balas kepada :comment',
        'cancel' => 'Batal',
    ],

    'allow_comments' => 'Benarkan komen',

    'front' => [
        'admin_badge' => 'Admin',

        'list' => [
            'title' => ':count komen',
            'reply' => 'Balas',
            'reply_to' => 'Balas kepada :name',
            'cancel_reply' => 'Batal balasan',
            'waiting_for_approval_message' => 'Komen anda sedang menunggu kelulusan. Ini adalah pratonton, komen anda akan kelihatan setelah diluluskan.',
        ],

        'form' => [
            'title' => 'Tinggalkan komen',
            'description' => 'Alamat e-mel anda tidak akan diterbitkan. Medan yang diperlukan ditandai dengan *',
            'cookie_consent' => 'Simpan nama, e-mel dan laman web saya dalam pelayar ini untuk komen saya yang seterusnya.',
            'submit' => 'Hantar komen',
        ],

        'comment_success_message' => 'Komen anda telah berjaya dihantar.',
    ],

    'enums' => [
        'statuses' => [
            'pending' => 'Menunggu',
            'approved' => 'Diluluskan',
            'spam' => 'Spam',
            'trash' => 'Sampah',
        ],
    ],

    'settings' => [
        'title' => 'Comment',
        'description' => 'Konfigurasikan tetapan untuk Comment',

        'form' => [
            'enable_recaptcha' => 'Dayakan reCAPTCHA',
            'enable_recaptcha_help' => 'Anda perlu mendayakan reCAPTCHA di :url untuk menggunakan ciri ini.',
            'captcha_setting_label' => 'Tetapan Captcha',
            'comment_moderation' => 'Komen mesti diluluskan secara manual',
            'comment_moderation_help' => 'Semua komen mesti diluluskan secara manual oleh pentadbir sebelum dipaparkan di laman web.',
            'show_comment_cookie_consent' => 'Tunjukkan kotak semak kuki komen, membenarkan pelawat menyimpan maklumat mereka dalam pelayar',
            'auto_fill_comment_form' => 'Isi data komen secara automatik untuk pengguna yang log masuk',
            'auto_fill_comment_form_help' => 'Borang komen akan diisi secara automatik dengan data pengguna seperti nama penuh, e-mel dll., jika mereka telah log masuk.',
            'comment_order' => 'Susun komen mengikut',
            'comment_order_help' => 'Pilih susunan yang dikehendaki untuk memaparkan komen dalam senarai.',
            'comment_order_choices' => [
                'asc' => 'Paling lama',
                'desc' => 'Paling baru',
            ],
            'display_admin_badge' => 'Paparkan lencana admin untuk komen pentadbir',
            'show_admin_role_name_for_admin_badge' => 'Tunjukkan nama peranan admin untuk lencana admin',
            'show_admin_role_name_for_admin_badge_helper' => 'Jika didayakan, lencana admin akan memaparkan nama peranan admin dan bukannya teks lalai "Admin". Jika nama peranan admin kosong, teks lalai akan digunakan. Jika pengguna mempunyai berbilang peranan, peranan pertama akan digunakan.',
            'default_avatar' => 'Avatar lalai',
            'default_avatar_helper' => 'Avatar lalai untuk pengarang apabila mereka tidak mempunyai avatar. Jika anda tidak memilih sebarang imej, ia akan dijana menggunakan Gravatar. Saiz imej mestilah 150x150px.',
        ],
    ],
];