<?php

namespace App\Http\Requests;

use App\Enums\ContactType;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ContactRequest extends BaseFormRequest {
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function store(): array {
        return [
            'type'      => ['required', Rule::in(ContactType::cases())],
            'title'     => ['required', 'max:255'],
            'on'        => ['required'],
            'on_id'     => ['required', 'integer'],
            'address_1' => ['min:3', 'max:255'],
            'address_2' => ['min:3', 'max:255'],
            'city'      => ['min:3', 'max:255'],
            'state'     => ['min:3', 'max:255'],
            'zip'       => ['min:3', 'max:255'],
        ];
    }
}
