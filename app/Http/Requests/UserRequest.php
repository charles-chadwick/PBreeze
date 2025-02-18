<?php

namespace App\Http\Requests;

use App\Enums\PatientGender;
use App\Enums\UserRole;
use App\Enums\UserStatus;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserRequest extends BaseFormRequest {

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool {
        return false;
    }

    /**
     * Get the validation rules.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function store(): array {
        return [
            'status'      => ['required', Rule::in(UserStatus::cases())],
            'role'        => ['required', Rule::in(UserRole::cases())],
            'first_name'  => ['required', 'string', 'max:255'],
            'middle_name' => ['string', 'max:255'],
            'last_name'   => ['required', 'string', 'max:255'],
            'email'       => ['required', 'string', 'email', 'max:255'],
            'password'    => ['required', 'string', 'min:8', 'confirmed'],
            'gender'      => [
                Rule::in(PatientGender::cases())
            ],
            'dob'         => [
                Rule::date()
                    ->format('Y-m-d')
            ],
        ];
    }

    /**
     * Store user rules
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function update(): array {
        return $this->store();
    }
}
