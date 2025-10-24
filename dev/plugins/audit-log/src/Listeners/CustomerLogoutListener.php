<?php

namespace Dev\AuditLog\Listeners;

use Dev\ACL\Models\User;
use Dev\AuditLog\Models\AuditHistory;
use Dev\Base\Facades\BaseHelper;
use Dev\Ecommerce\Models\Customer;
use Exception;
use Illuminate\Auth\Events\Logout;
use Illuminate\Http\Request;

class CustomerLogoutListener
{
    public function __construct(protected Request $request)
    {
    }

    public function handle(Logout $event): void
    {
        $user = $event->user;

        if (! $user instanceof User) {
            if (! is_plugin_active('ecommerce') || ! $user instanceof Customer) {
                return;
            }
        }

        try {
            $module = $user instanceof User ? trans('plugins/audit-log::history.from_the_admin_panel') : trans('plugins/audit-log::history.from_the_customer_portal');
            $action = trans('plugins/audit-log::history.logged_out');

            AuditHistory::query()->create([
                'user_agent' => $this->request->userAgent(),
                'ip_address' => $this->request->ip(),
                'module' => $module,
                'action' => $action,
                'user_id' => $user->getKey(),
                'user_type' => $user::class,
                'actor_id' => $user->getKey(),
                'actor_type' => $user::class,
                'reference_id' => $user->getKey(),
                'reference_name' => $user->name,
                'type' => 'info',
            ]);
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
