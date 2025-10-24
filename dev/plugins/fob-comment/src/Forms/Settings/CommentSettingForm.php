<?php

namespace Dev\Comment\Forms\Settings;

use Dev\Base\Facades\Html;
use Dev\Base\Forms\FieldOptions\MediaImageFieldOption;
use Dev\Base\Forms\FieldOptions\OnOffFieldOption;
use Dev\Base\Forms\FieldOptions\RadioFieldOption;
use Dev\Base\Forms\FieldOptions\SelectFieldOption;
use Dev\Base\Forms\Fields\MediaImageField;
use Dev\Base\Forms\Fields\OnOffCheckboxField;
use Dev\Base\Forms\Fields\RadioField;
use Dev\Base\Forms\Fields\SelectField;
use Dev\Base\Forms\FormAbstract;
use Dev\Captcha\Facades\Captcha;
use Dev\Setting\Forms\SettingForm;
use Dev\Comment\Http\Requests\Settings\CommentSettingRequest;
use Dev\Comment\Support\CommentHelper;

class CommentSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setValidatorClass(CommentSettingRequest::class)
            ->setSectionTitle(trans('plugins/comment::comment.settings.title'))
            ->setSectionDescription(trans('plugins/comment::comment.settings.description'))
            ->when(is_plugin_active('captcha'), function (FormAbstract $form): void {
                $form->add(
                    'fob_comment_enable_recaptcha',
                    OnOffCheckboxField::class,
                    OnOffFieldOption::make()
                        ->label(trans('plugins/comment::comment.settings.form.enable_recaptcha'))
                        ->value(setting('fob_comment_enable_recaptcha', false))
                        ->when(! Captcha::isEnabled(), function (OnOffFieldOption $option) {
                            return $option->helperText(
                                trans(
                                    'plugins/comment::comment.settings.form.enable_recaptcha_help',
                                    ['url' => Html::link(
                                        route('captcha.settings'),
                                        trans('plugins/comment::comment.settings.form.captcha_setting_label')
                                    )]
                                )
                            );
                        })
                        ->toArray()
                );
            })
            ->add(
                'fob_comment_comment_moderation',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/comment::comment.settings.form.comment_moderation'))
                    ->helperText(trans('plugins/comment::comment.settings.form.comment_moderation_help'))
                    ->value(CommentHelper::commentMustBeModerated())
                    ->toArray()
            )
            ->add(
                'fob_comment_show_comment_cookie_consent',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/comment::comment.settings.form.show_comment_cookie_consent'))
                    ->value(CommentHelper::isShowCommentCookieConsent())
                    ->toArray()
            )
            ->add(
                'fob_comment_email_optional',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/comment::comment.settings.form.email_optional'))
                    ->helperText(trans('plugins/comment::comment.settings.form.email_optional_help'))
                    ->value(setting('fob_comment_email_optional', false))
                    ->toArray()
            )
            ->add(
                'fob_comment_auto_fill_comment_form',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/comment::comment.settings.form.auto_fill_comment_form'))
                    ->value(CommentHelper::isAutoFillCommentForm())
                    ->helperText(trans('plugins/comment::comment.settings.form.auto_fill_comment_form_help'))
                    ->toArray()
            )
            ->add(
                'fob_comment_comment_order',
                RadioField::class,
                RadioFieldOption::make()
                    ->label(trans('plugins/comment::comment.settings.form.comment_order'))
                    ->helperText('Choose the preferred order for displaying comments in the list.')
                    ->choices([
                        'asc' => trans('plugins/comment::comment.settings.form.comment_order_choices.asc'),
                        'desc' => trans('plugins/comment::comment.settings.form.comment_order_choices.desc'),
                    ])
                    ->selected(CommentHelper::getCommentOrder())
                    ->toArray()
            )
            ->add(
                'fob_comment_display_admin_badge',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/comment::comment.settings.form.display_admin_badge'))
                    ->value(CommentHelper::isDisplayAdminBadge())
                    ->toArray()
            )
            ->add(
                'fob_comment_show_admin_role_name_for_admin_badge',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/comment::comment.settings.form.show_admin_role_name_for_admin_badge'))
                    ->helperText(trans('plugins/comment::comment.settings.form.show_admin_role_name_for_admin_badge_helper'))
                    ->value(setting('fob_comment_show_admin_role_name_for_admin_badge', 'true'))
                    ->toArray()
            )
            ->add(
                'fob_comment_avatar_provider',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/comment::comment.settings.form.avatar_provider'))
                    ->helperText(trans('plugins/comment::comment.settings.form.avatar_provider_help'))
                    ->choices([
                        'gravatar' => trans('plugins/comment::comment.settings.form.avatar_provider_choices.gravatar'),
                        'ui_avatars' => trans('plugins/comment::comment.settings.form.avatar_provider_choices.ui_avatars'),
                    ])
                    ->selected(setting('fob_comment_avatar_provider', 'gravatar'))
                    ->toArray()
            )
            ->add(
                'fob_comment_default_avatar',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(trans('plugins/comment::comment.settings.form.default_avatar'))
                    ->helperText(trans('plugins/comment::comment.settings.form.default_avatar_helper'))
                    ->value(setting('fob_comment_default_avatar'))
                    ->toArray()
            );
    }
}
