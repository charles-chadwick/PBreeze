<?php

namespace App\Actions\Schedules;

use App\Models\Schedule;
use App\Models\ScheduleUser;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;

class UpdateSchedule {
	
	/**
	 * Handle the store contact action
	 *
	 * @param Request $request
	 * @return true
	 */
	public function handle(Request $request, Schedule $schedule): bool {

		$schedule->update($request->validated());

		return true;
	}
}
