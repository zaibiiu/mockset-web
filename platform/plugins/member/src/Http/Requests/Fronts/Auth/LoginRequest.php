<?php

namespace Botble\Member\Http\Requests\Fronts\Auth;

use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class LoginRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => [
                'required',
                'string',
                function ($attribute, $value, $fail) {
                    if (filter_var($value, FILTER_VALIDATE_EMAIL)) {
                        return;
                    }

                    if (! preg_match('/^\+?[0-9]{7,15}$/', $value)) {
                        $fail(__('The :attribute must be a valid email address or phone number.'));
                    }
                },
            ],
            'password' => ['required', 'string'],
        ];
    }

    public function messages()
    {
        return [
            'login.required' => __('The login field is required.'),
            'login.string' => __('The login field must be a string.'),
            'password.required' => __('The password field is required.'),
            'password.string' => __('The password field must be a string.'),
        ];
    }
}
