<?php

namespace Database\Seeders;

use App\Enums\UserRole;
use App\Models\Schedule;
use App\Models\ScheduleUser;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ScheduleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
		DB::table('schedules')->delete();
		DB::table('schedule_users')->delete();
		$last_date = Carbon::now()->nextWeekday();
        for($i = 1; $i <= 10; $i++) {
			$date = fake()->dateTimeBetween($last_date, "{$i} week")->format('Y-m-d');
			$schedule = Schedule::create([
				'type' => 'Office',
				'start' => $date.' 10:00',
				'end' => $date.' 15:00',
				'title' => 'Available',
				'description' => fake()->text(rand(5, 100)),
				'created_by' => 1
			]);
			
			foreach(User::whereIn('role', UserRole::allStaff())->limit(rand(1, 3))->inRandomOrder()->get() as $user) {
				ScheduleUser::create([
					'schedule_id' => $schedule->id,
					'user_id' => $user->id,
					'created_by' => 1
				]);
			};
			
		}
    }
}
