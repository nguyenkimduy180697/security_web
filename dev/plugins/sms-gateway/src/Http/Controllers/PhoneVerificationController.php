<?php

namespace Dev\Sms\Http\Controllers;

use Dev\Base\Facades\BaseHelper;
use Dev\Base\Http\Controllers\BaseController;
use Dev\SeoHelper\Facades\SeoHelper;
use Dev\Theme\Facades\Theme;
use Carbon\Carbon;
use Dev\Sms\Facades\Guard;
use Dev\Sms\Facades\Otp as OtpFacade;
use Dev\Sms\Forms\PhoneVerificationForm;
use Dev\Sms\Http\Requests\PhoneVerificationRequest;

class PhoneVerificationController extends BaseController
{
    public function index()
    {
        SeoHelper::setTitle(__('Phone Number Verification'));

        $form = PhoneVerificationForm::create();
        $identifier = auth(Guard::getGuard())->user()->phone;
        $expiryTime = OtpFacade::getExpiryTime($identifier);

        return Theme::scope(
            'otp.verify',
            compact('form', 'identifier', 'expiryTime'),
            'plugins/sms-gateway::phone-verification.verify'
        )->render();
    }

    public function store(PhoneVerificationRequest $request)
    {
        $user = $request->user(Guard::getGuard());

        if (! OtpFacade::verify($user->phone, $request->input('otp'))) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage(__('Your OTP is invalid or expired.'));
        }

        $user->phone_verified_at = Carbon::now();
        $user->save();

        return $this
            ->httpResponse()
            ->setNextUrl(BaseHelper::getHomepageUrl())
            ->setMessage(__('Your phone number has been verified successfully.'));
    }
}
