<?php

namespace Botble\RealEstate\Http\Middleware;

use Botble\Base\Http\Responses\BaseHttpResponse;
use Closure;
use Illuminate\Support\Facades\Auth;
use Botble\RealEstate\Facades\RealEstateHelper;
use Symfony\Component\HttpFoundation\Response;

class RedirectIfNotAccount
{
    public function handle($request, Closure $next, $guard = 'account')
    {
        if (!RealEstateHelper::isLoginEnabled()) {
            abort(404);
        }

        if (!Auth::guard($guard)->check()) {
            if ($request->ajax() || $request->wantsJson()) {
                $response = new BaseHttpResponse();
                return $response->setStatusCode(Response::HTTP_UNAUTHORIZED)
                    ->setData(['next_page' => route('public.account.login')]);
                // return response('Unauthorized.', 401);
            }

            return redirect()->guest(route('public.account.login'));
        }

        return $next($request);
    }
}
