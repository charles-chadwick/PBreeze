<?php

namespace App\Http\Controllers;

use App\Actions\Appointments\PatientHasAppointment;
use App\Actions\Appointments\StoreAppointment;
use App\Actions\Appointments\UpdateAppointment;
use App\Http\Requests\AppointmentRequest;
use App\Models\Appointment;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\MessageBag;

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
	 * Store a/an appointment record
	 *
	 * @param AppointmentRequest $request
	 *
	 * @return Appointment|RedirectResponse
	 */
	public function store (AppointmentRequest $request, StoreAppointment $storeAppointment): Appointment|RedirectResponse {
		
		if (( new PatientHasAppointment() )->handle($request)) {
			return redirect()
				->back()
				->withErrors([
					'message' => __("This patient is already scheduled at this time.")
				]);
		}
		
		return $storeAppointment->handle($request);
		
	}
	
	/**
	 * Update a/an appointment record
	 *
	 * @param AppointmentRequest $request
	 * @param Appointment        $appointment
	 * @param UpdateAppointment  $updateAppointment
	 *
	 * @return bool
	 */
	public function update (AppointmentRequest $request, Appointment $appointment, UpdateAppointment $updateAppointment): bool {
		
		return $updateAppointment->handle($appointment, $request);
	}
	
	/**
	 * Show a/an appointment record
	 *
	 * @param Appointment $appointment
	 *
	 * @return Appointment
	 */
	public function show (Appointment $appointment): Appointment {
		
		return $appointment;
	}
	
	/**
	 * Delete a/an appointment record
	 *
	 * @param Appointment $appointment
	 *
	 * @return bool|null
	 */
	public function destroy (Appointment $appointment): bool|null {
		
		return $appointment->delete();
	}
	
}
