<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class StoreScheduleRequest extends FormRequest {
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
    public function rules(): array {
        return [
            "type"        => ['required', 'string'],
            "date"        => ['required', 'date'],
            "start"       => ['required', 'date_format:H:i'],
            "end"         => ['required', 'date_format:H:i'],
            "location"    => ['string'],
            "title"       => ['string'],
            "description" => ['string'],
            'user_id'     => ['required']
        ];
    }
}
