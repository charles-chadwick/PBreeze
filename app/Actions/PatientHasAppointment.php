<?php

namespace App\Actions;
use App\Enums\AppointmentStatus;
use App\Models\Appointment;
use Illuminate\Http\Request;

class PatientHasAppointment
{
    public function handle(Request $request): bool {

		return Appointment::where('patient_id', $request->get('patient_id'))
			->whereBetween('start', [$request->get('start'), $request->get('end')])
			->whereBetween('end', [$request->get('start'), $request->get('end')])
			->whereIn('status', AppointmentStatus::available())
			->exists() !== true;
    }
}
