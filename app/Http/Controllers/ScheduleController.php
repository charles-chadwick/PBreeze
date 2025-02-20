<?php

namespace App\Http\Controllers;

use App\Actions\Schedules\StoreSchedule;
use App\Actions\Schedules\SyncScheduleUsers;
use App\Actions\Schedules\UpdateSchedule;
use App\Actions\Schedules\UserIsScheduled;
use App\Http\Requests\ScheduleRequest;
use App\Models\Schedule;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Collection;
use Illuminate\Support\MessageBag;

class ScheduleController extends Controller {

    /**
     * Display a listing of the schedules.
     *
     * @return Collection
     */
    public function index(): mixed {
        return Schedule::with('users')->find(6);
    }

    /**
     * Store a newly created schedule in storage.
     *
     * @param ScheduleRequest $request
     * @param StoreSchedule $storeSchedule
     * @return RedirectResponse|Schedule
     */
    public function store(ScheduleRequest $request, StoreSchedule $storeSchedule): RedirectResponse|Schedule {

		// create
        $schedule = $storeSchedule->handle($request);
		
		// insert users
		(new SyncScheduleUsers())->handle($request, $schedule);
		
		return $schedule;
		
    }

    /**
     * Display the specified schedule.
     *
     * @param Schedule $schedule
     * @return Schedule $schedule
     */
    public function show(Schedule $schedule): Schedule {
        $schedule->load('users');
        return $schedule;
    }

    /**
     * Update the specified schedule in storage.
     *
     * @param ScheduleRequest $request
     * @param Schedule $schedule
     * @return bool|null
     */
    public function update(ScheduleRequest $request, Schedule $schedule, UpdateSchedule $updateSchedule): RedirectResponse|Schedule {

		// update the schedule
        $updateSchedule->handle($request, $schedule);
		
		// sync the users
		(new SyncScheduleUsers())->handle($request, $schedule);
		
	}

    /**
     * Remove the specified schedule from storage.
     *
     * @param Schedule $schedule
     * @return bool|null
     */
    public function destroy(Schedule $schedule): bool|null {
        //
    }
}
