<?php

namespace Dev\ACL\Http\Middleware;

use Dev\ACL\Models\User;
use Dev\Base\Http\Responses\BaseHttpResponse;
use Closure;
use Illuminate\Http\Request;

class CheckUserUpdatePermission
{
    public function handle(Request $request, Closure $next)
    {
        $currentUser = $request->user();

        /**
         * @var User $user
         */
        $user = $request->route('user');

        $hasRightToUpdate = $currentUser->hasPermission('users.edit')
            || $currentUser->getKey() === $user->getKey()
            || $currentUser->isSuperUser();

        if (! $hasRightToUpdate) {
            return BaseHttpResponse::make()
                ->setNextUrl($user->url)
                ->setError()
                ->setMessage(trans('core/acl::permissions.access_denied_message'));
        }

        return $next($request);
    }
}
