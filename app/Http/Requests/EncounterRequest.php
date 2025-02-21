<?php

namespace App\Http\Requests;

use App\Http\Requests\BaseFormRequest;
use Illuminate\Contracts\Validation\ValidationRule;

class EncounterRequest extends BaseFormRequest {
	
	/**
	 * Determine if the user is authorized to make this request.
	 */
	public function authorize (): bool {
		
		return true;
	}
	
	/**
	 * Get the store validation rules
	 *
	 * @return array<string, ValidationRule|array<mixed>|string>
	 */
	public function store (): array {
		
		return [
		"appointment_id" => [ "nullable", "exists:appointments,id" ],
		"patient_id"     => [ "required", "exists:users,id" ],
			"type"           => [ "required", "string" ],
			"status"         => [ "required", "string" ],
			"date"           => [ "required", "date" ],
			"title"          => [ "required", "string" ],
			"content"        => [ "nullable", "string" ],
		
		];
	}
	
	/**
	 * Get the update validation rules
	 *
	 * @return array<string, ValidationRule|array<mixed>|string>
	 */
	public function update (): array {
		
		return $this->store(); // change this in case the rules are different
	}
	
}
