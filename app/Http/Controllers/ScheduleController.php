<?php

namespace App\Http\Controllers;

use App\Actions\SyncScheduleUsers;
use App\Http\Requests\ScheduleRequest;
use App\Models\Schedule;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Collection;

class ScheduleController extends Controller {
	
	/**
	 * Display a listing of the schedules.
	 *
	 * @return Collection
	 */
	public function index (): mixed {
		
		return Schedule::with('users')
					   ->find(6);
	}
	
	/**
	 * Store a newly created schedule in storage.
	 *
	 * @param ScheduleRequest $request
	 * @return RedirectResponse|Schedule
	 */
	public function store (ScheduleRequest $request): RedirectResponse|Schedule {
		
		// create
		$schedule = Schedule::create($request->validated());
		
		// insert users
		( new SyncScheduleUsers() )->handle($request, $schedule);
		
		return $schedule;
		
	}
	
	/**
	 * Display the specified schedule.
	 *
	 * @param Schedule $schedule
	 * @return Schedule $schedule
	 */
	public function show (Schedule $schedule): Schedule {
		
		$schedule->load('users');
		
		return $schedule;
	}
	
	/**
	 * Update the specified schedule in storage.
	 *
	 * @param ScheduleRequest $request
	 * @param Schedule        $schedule
	 * @return bool|null
	 */
	public function update (ScheduleRequest $request, Schedule $schedule): bool|null {
		
		// update the schedule
		$schedule->update($request->validated());
		
		// sync the users
		( new SyncScheduleUsers() )->handle($request, $schedule);
	}
	
	/**
	 * Remove the specified schedule from storage.
	 *
	 * @param Schedule $schedule
	 * @return bool|null
	 */
	public function destroy (Schedule $schedule): bool|null {
		
		return $schedule->delete();
	}
	
}
