<?php

return [
    'common' => [
        'name' => '名前',
        'email' => 'メールアドレス',
        'website' => 'ウェブサイト',
        'comment' => 'コメント',
        'email_placeholder' => 'メールアドレスは公開されません。',
        'website_placeholder' => '例：https://example.com',
    ],

    'title' => 'コメント',
    'author' => '投稿者',
    'responsed_to' => '返信先',
    'permalink' => 'パーマリンク',
    'url' => 'URL',
    'submitted_on' => '投稿日',
    'edit_comment' => 'コメントを編集',
    'reply' => '返信',
    'in_reply_to' => ':name への返信',

    'reply_modal' => [
        'title' => ':comment に返信',
        'cancel' => 'キャンセル',
    ],

    'allow_comments' => 'コメントを許可',

    'front' => [
        'admin_badge' => '管理者',

        'list' => [
            'title' => ':count 件のコメント',
            'reply' => '返信',
            'reply_to' => ':name に返信',
            'cancel_reply' => '返信をキャンセル',
            'waiting_for_approval_message' => 'あなたのコメントは承認待ちです。これはプレビューで、承認後に表示されます。',
        ],

        'form' => [
            'title' => 'コメントを残す',
            'description' => 'メールアドレスは公開されません。必須項目は * でマークされています',
            'cookie_consent' => '次回のコメント時のために、名前、メールアドレス、ウェブサイトをこのブラウザに保存する。',
            'submit' => 'コメントを送信',
        ],

        'comment_success_message' => 'コメントが正常に送信されました。',
    ],

    'enums' => [
        'statuses' => [
            'pending' => '保留中',
            'approved' => '承認済み',
            'spam' => 'スパム',
            'trash' => 'ゴミ箱',
        ],
    ],

    'settings' => [
        'title' => 'Comment',
        'description' => 'Comment の設定を構成',

        'form' => [
            'enable_recaptcha' => 'reCAPTCHA を有効化',
            'enable_recaptcha_help' => 'この機能を使用するには、:url で reCAPTCHA を有効にする必要があります。',
            'captcha_setting_label' => 'キャプチャ設定',
            'comment_moderation' => 'コメントは手動で承認する必要があります',
            'comment_moderation_help' => 'すべてのコメントはフロントエンドに表示される前に管理者による手動承認が必要です。',
            'show_comment_cookie_consent' => 'コメントクッキーのチェックボックスを表示し、訪問者がブラウザに情報を保存できるようにする',
            'auto_fill_comment_form' => 'ログインユーザーのコメントデータを自動入力',
            'auto_fill_comment_form_help' => 'ログインしている場合、コメントフォームにユーザーデータ（フルネーム、メールアドレスなど）が自動的に入力されます。',
            'comment_order' => 'コメントの並び順',
            'comment_order_help' => 'リストでコメントを表示する優先順序を選択してください。',
            'comment_order_choices' => [
                'asc' => '古い順',
                'desc' => '新しい順',
            ],
            'display_admin_badge' => '管理者コメントに管理者バッジを表示',
            'show_admin_role_name_for_admin_badge' => '管理者バッジに管理者ロール名を表示',
            'show_admin_role_name_for_admin_badge_helper' => '有効にすると、管理者バッジはデフォルトの「管理者」テキストの代わりに管理者ロール名を表示します。管理者ロール名が空の場合、デフォルトテキストが使用されます。ユーザーが複数のロールを持つ場合、最初のロールが使用されます。',
            'default_avatar' => 'デフォルトアバター',
            'default_avatar_helper' => '投稿者がアバターを持っていない場合のデフォルトアバター。画像を選択しない場合、Gravatar を使用して生成されます。画像サイズは 150x150px である必要があります。',
        ],
    ],
];