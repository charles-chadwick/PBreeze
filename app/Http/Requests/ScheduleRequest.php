<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class ScheduleRequest extends BaseFormRequest {

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool {
        return true;
    }

    /**
     * Get the validation rules that apply to storing.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function store(): array {
        return [
            "type"        => ['required', 'string'],
			"start"       => [ 'required', 'date' ],
			"end"         => [ 'required', 'date' ],
            "location"    => ['string'],
            "title"       => ['string'],
            "description" => ['string'],
            'user_id'     => ['required']
        ];
    }

    /**
     * Get the validation rules that apply to updating
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function update(): array {

        // these are the same, no sense in writing them twice
        return $this->store();
    }
}
