<?php

namespace Dev\Contact\Providers;

use Dev\Base\Supports\ServiceProvider;
use Dev\Contact\Enums\ContactStatusEnum;
use Dev\Contact\Forms\Fronts\ContactForm;
use Dev\Contact\Forms\ShortcodeContactAdminConfigForm;
use Dev\Contact\Http\Requests\ContactRequest;
use Dev\Contact\Models\Contact;
use Dev\Contact\Models\CustomField;
use Dev\Shortcode\Compilers\Shortcode;
use Dev\Shortcode\Facades\Shortcode as ShortcodeFacade;
use Dev\Support\Services\Cache\Cache;
use Dev\Theme\FormFrontManager;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        add_filter(BASE_FILTER_TOP_HEADER_LAYOUT, [$this, 'registerTopHeaderNotification'], 120);
        add_filter(BASE_FILTER_APPEND_MENU_NAME, [$this, 'getUnreadCount'], 120, 2);
        add_filter(BASE_FILTER_MENU_ITEMS_COUNT, [$this, 'getMenuItemCount'], 120);

        FormFrontManager::register(ContactForm::class, ContactRequest::class);

        if (class_exists(ShortcodeFacade::class)) {
            ShortcodeFacade::register(
                'contact-form',
                trans('plugins/contact::contact.shortcode_name'),
                trans('plugins/contact::contact.shortcode_description'),
                [$this, 'form']
            );

            ShortcodeFacade::setAdminConfig('contact-form', function (array $attributes) {
                return ShortcodeContactAdminConfigForm::createFromArray($attributes);
            });

            ShortcodeFacade::ignoreLazyLoading(['contact-form']);
            ShortcodeFacade::ignoreCaches(['contact-form']);
        }

        add_filter('form_extra_fields_render', function (?string $fields = null, ?string $form = null): ?string {
            if ($form && $form !== ContactForm::class) {
                return $fields;
            }

            $customFields = CustomField::query()
                ->wherePublished()->with('options')
                ->oldest('order')
                ->get();

            if ($customFields->isEmpty()) {
                return $fields;
            }

            return $fields . view('plugins/contact::forms.old-version-support', compact('customFields'))->render();
        }, 128, 2);
    }

    public function registerTopHeaderNotification(?string $options): ?string
    {
        if (Auth::guard()->user()->hasPermission('contacts.edit')) {
            $cache = Cache::make(Contact::class);

            if ($cache->has('unread-contacts')) {
                $contacts = $cache->get('unread-contacts');
            } else {
                $contacts = Contact::query()
                    ->where('status', ContactStatusEnum::UNREAD)
                    ->select(['id', 'name', 'email', 'phone', 'created_at'])->latest()
                    ->paginate(10);

                $cache->put('unread-contacts', $contacts, 60 * 60 * 24);
            }

            if ($contacts->total() == 0) {
                return $options;
            }

            return $options . view('plugins/contact::partials.notification', compact('contacts'))->render();
        }

        return $options;
    }

    public function getUnreadCount(string|null|int $number, string $menuId): int|string|null
    {
        if ($menuId !== 'cms-plugins-contact') {
            return $number;
        }

        return view('core/base::partials.navbar.badge-count', ['class' => 'unread-contacts'])->render();
    }

    public function getMenuItemCount(array $data = []): array
    {
        if (! Auth::guard()->user()->hasPermission('contacts.index')) {
            return $data;
        }

        $cache = Cache::make(Contact::class);

        if ($cache->has('unread-contacts-count')) {
            $contactCount = $cache->get('unread-contacts-count');
        } else {
            $contactCount = Contact::query()->where('status', ContactStatusEnum::UNREAD)->count();

            $cache->put('unread-contacts-count', $contactCount, 60 * 60 * 24);
        }

        $data[] = [
            'key' => 'unread-contacts',
            'value' => $contactCount,
        ];

        return $data;
    }

    public function form(Shortcode $shortcode): string
    {
        $view = apply_filters(CONTACT_FORM_TEMPLATE_VIEW, 'plugins/contact::forms.contact');

        if ($shortcode->view && view()->exists($shortcode->view)) {
            $view = $shortcode->view;
        }

        $form = ContactForm::createFromArray(
            Arr::except($shortcode->toArray(), ['name', 'email', 'phone', 'content', 'subject', 'address'])
        );

        add_filter('contact_request_rules', function (array $rules, ContactRequest $request) use ($shortcode): array {
            return $request->applyRules($rules, $shortcode->display_fields, $shortcode->mandatory_fields);
        }, 120, 2);

        return view($view, compact('shortcode', 'form'))->render();
    }
}
