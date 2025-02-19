<?php

namespace App\Actions\Appointments;
use App\Models\Appointment;
use Illuminate\Http\Request;

class StoreAppointment
{
    public function handle(Request $request) : Appointment {
        return Appointment::create($request->validated());
    }
}
