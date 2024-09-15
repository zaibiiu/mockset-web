<?php

namespace Botble\Member\Http\Controllers;

use Botble\ACL\Traits\AuthenticatesUsers;
use Botble\ACL\Traits\LogoutGuardTrait;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Member\Forms\Fronts\Auth\LoginForm;
use Botble\Member\Http\Requests\Fronts\Auth\LoginRequest;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class LoginController extends BaseController
{
    use AuthenticatesUsers, LogoutGuardTrait {
        AuthenticatesUsers::attemptLogin as baseAttemptLogin;
    }

    public function showLoginForm()
    {
        SeoHelper::setTitle(trans('plugins/member::member.login'));

        if (! session()->has('url.intended')) {
            session(['url.intended' => url()->previous()]);
        }

        Theme::breadcrumb()->add(__('Login'), route('public.member.login'));

        return Theme::scope(
            'member.auth.login',
            ['form' => LoginForm::create()],
            'plugins/member::themes.auth.login'
        )->render();
    }

    public function login(LoginRequest $request)
    {
        $this->validateLogin($request);

        if ($this->hasTooManyLoginAttempts($request)) {
            $this->fireLockoutEvent($request);
            return $this->sendLockoutResponse($request);
        }

        if ($this->attemptLogin($request)) {
            return $this->sendLoginResponse($request);
        }

        $this->incrementLoginAttempts($request);
        return $this->sendFailedLoginResponse();
    }

    protected function attemptLogin(Request $request)
    {
        $credentials = $this->credentials($request);

        if ($this->guard()->validate($credentials)) {
            $member = $this->guard()->getLastAttempted();

            if (setting('verify_account_email', config('plugins.member.general.verify_email')) && empty($member->confirmed_at)) {
                throw ValidationException::withMessages([
                    'confirmation' => [
                        trans('plugins/member::member.not_confirmed', [
                            'resend_link' => route('public.member.resend_confirmation', ['email' => $member->email]),
                        ]),
                    ],
                ]);
            }

            return $this->baseAttemptLogin($request);
        }

        return false;
    }

    protected function credentials(Request $request)
    {
        $input = $request->only('email', 'password');
        $inputType = filter_var($input['email'], FILTER_VALIDATE_EMAIL) ? 'email' : 'phone_number';

        return [
            $inputType => $input['email'],
            'password' => $input['password'],
        ];
    }


    protected function guard()
    {
        return auth('member');
    }

    public function logout(Request $request)
    {
        $activeGuards = 0;
        $this->guard()->logout();

        foreach (config('auth.guards', []) as $guard => $guardConfig) {
            if ($guardConfig['driver'] !== 'session') {
                continue;
            }
            if ($this->isActiveGuard($request, $guard)) {
                $activeGuards++;
            }
        }

        if (! $activeGuards) {
            $request->session()->flush();
            $request->session()->regenerate();
        }

        $this->loggedOut($request);

        return redirect()->to(BaseHelper::getHomepageUrl());
    }
}
