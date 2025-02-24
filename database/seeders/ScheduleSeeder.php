<?php

namespace Database\Seeders;

use App\Enums\AppointmentStatus;
use App\Enums\UserRole;
use App\Models\Appointment;
use App\Models\Patient;
use App\Models\Schedule;
use App\Models\ScheduleUser;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ScheduleSeeder extends Seeder {
	
	/**
	 * Run the database seeds.
	 */
	public function run (): void {
		
		DB::table('schedules')
		  ->delete();
		DB::table('schedule_users')
		  ->delete();
		DB::table('appointments')
		  ->delete();
		
		$last_date = Carbon::now()
						   ->nextWeekday();
		
		// create the date of the appt
		for ( $i = 1; $i <= 10; $i++ ) {
			
			$date = fake()
				->dateTimeBetween($last_date, "{$i} week")
				->format('Y-m-d');
			
			$created_by = User::whereIn('role', UserRole::allStaff())
							  ->inRandomOrder()
							  ->first()->id;
			
			$schedule = Schedule::create([
				'type'        => 'Office',
				'start'       => $date . ' 10:00',
				'end'         => $date . ' 15:00',
				'title'       => 'Available',
				'description' => fake()->text(rand(5, 100)),
				'created_by'  => $created_by,
			]);
			
			// create the user
			foreach ( User::whereIn('role', UserRole::allStaff())
						  ->limit(rand(1, 3))
						  ->inRandomOrder()
						  ->get() as $user ) {
				ScheduleUser::create([
					'schedule_id' => $schedule->id,
					'user_id'     => $user->id,
					'created_by'  => $user->id
				]);
			};
			
			// now create random appts in that time frame fo the patient
			for ( $appt_index = 0; $appt_index < rand(1, 3); $appt_index++ ) {
				
				$start = Carbon::parse($date . ' 10:00')
							   ->addMinutes($appt_index * 15)
							   ->format('Y-m-d H:i:s');
				$end = Carbon::parse($start)
							 ->addMinutes($appt_index + 15)
							 ->format('Y-m-d H:i:s');
				
				Appointment::create([
					'schedule_id' => $schedule->id,
					'patient_id'  => User::where('role', UserRole::Patient)
										 ->get()
										 ->random()->id,
					'status'      => AppointmentStatus::Scheduled,
					'start'       => $start,
					'end'         => $end,
					'title'       => "Patient Appt",
					'comments'    => fake()->text(rand(5, 100)),
					'created_by'  => $created_by
				]);
			}
			
		}
	}
	
}
