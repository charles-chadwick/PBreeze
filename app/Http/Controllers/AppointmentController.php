<?php

namespace App\Http\Controllers;

use App\Actions\PatientHasAppointment;
use App\Http\Requests\AppointmentRequest;
use App\Models\Appointment;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\RedirectResponse;

class AppointmentController extends Controller {
	
	/**
	 * Show a listing of all Appointment
	 *
	 * @return Collection
	 */
	public function index () {
		
		return Appointment::get();
	}
	
	/**
	 * Store an appointment record
	 *
	 * @param AppointmentRequest $request
	 *
	 * @return Appointment|RedirectResponse
	 */
	public function store (AppointmentRequest $request): Appointment|RedirectResponse {
		
		// check to see if this patient has an appointment
		if (( new PatientHasAppointment() )->handle($request)) {
			return redirect()
				->back()
				->withErrors([
					'message' => __("This patient is already scheduled at this time.")
				]);
		}
		
		return Appointment::create($request->validated());
	}
	
	/**
	 * Update an appointment record
	 *
	 * @param AppointmentRequest $request
	 * @param Appointment        $appointment
	 *
	 * @return bool
	 */
	public function update (AppointmentRequest $request, Appointment $appointment): bool {
		
		return $appointment->update($request->validated());
	}
	
	/**
	 * Show an appointment record
	 *
	 * @param Appointment $appointment
	 * @return Appointment
	 */
	public function show (Appointment $appointment): Appointment {
		
		return $appointment;
	}
	
	/**
	 * Delete an appointment record
	 *
	 * @param Appointment $appointment
	 * @return bool|null
	 */
	public function destroy (Appointment $appointment): bool|null {
		
		return $appointment->delete();
	}
	
}
