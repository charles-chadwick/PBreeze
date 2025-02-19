<?php

namespace App\Actions\Appointments;
use App\Models\Appointment;
use Illuminate\Http\Request;

class UpdateAppointment
{
    public function handle(Appointment $appointment, Request $request): bool {
        return $appointment->update($request->validated());
    }
}
