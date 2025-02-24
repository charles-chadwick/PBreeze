<?php

namespace Database\Seeders;

use App\Enums\EncounterStatus;
use App\Enums\UserRole;
use App\Models\Appointment;
use App\Models\Encounter;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EncounterSeeder extends Seeder {
	
	/**
	 * Run the database seeds.
	 */
	public function run (): void {
		
		DB::table('encounters')
		  ->delete();
		
		foreach ( User::where('role', UserRole::Patient)
					  ->get() as $patient ) {
			
			// create at least one encounter for this patient that's assigned to an appt
			$appointments = Appointment::where('patient_id', $patient->id)
									   ->get();
			
			foreach ( $appointments as $appointment ) {
				
				Encounter::create([
					'type'           => 'Note',
					'patient_id'     => $patient->id,
					'appointment_id' => $appointment->id,
					'status'         => rand(1, 25) < 5 ? EncounterStatus::Signed : EncounterStatus::Unsigned,
					'date'           => $appointment->start,
					'title'          => $appointment->title,
					'content'        => fake()->paragraph(rand(1, 3)),
					'created_by'     => $appointment->created_by,
					'created_at'     => $appointment->start
				]);
			}
			
			// create some random notes not assigned to appts. or not
			for($i = 0; $i <= rand(0, 5); $i++) {
				
				$date = fake()->dateTimeBetween(now(), "1 month")->setTime(10, 00);
				Encounter::create([
					'type'           => 'Note',
					'patient_id'     => $patient->id,
					'appointment_id' => 0,
					'status'         => rand(1, 25) < 5 ? EncounterStatus::Signed : EncounterStatus::Unsigned,
					'date'           => $date,
					'title'          => "Misc Note",
					'content'        => fake()->paragraph(rand(1, 3)),
					'created_by'     => User::byRole()->inRandomOrder()->first()->id,
					'created_at'     => $date
				]);
			}
			
		}
	}
	
}
