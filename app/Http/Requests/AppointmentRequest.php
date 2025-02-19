<?php

namespace App\Http\Requests;

use App\Enums\AppointmentStatus;
use App\Models\Appointment;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class AppointmentRequest extends BaseFormRequest {
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool {
        return true;
    }

    /**
     * Get the store validation rules
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function store(): array {
        return [
            "patient_id"      => ["required", "exists:users,id"],
            "schedule_id"     => ["required", "exists:schedules,id"],
            "status"          => ["required", Rule::in(AppointmentStatus::cases())],
            "date_of_service" => ["required", "date"],
            "comments"        => ["nullable", "string"],
        ];
    }

    /**
     * Get the update validation rules
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function update(): array {
        return $this->store(); // change this in case the rules are different
    }
}
