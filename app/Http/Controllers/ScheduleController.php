<?php

namespace App\Http\Controllers;

use App\Actions\Schedules\CreateSchedule;
use App\Actions\Schedules\UserIsScheduled;
use App\Http\Requests\ScheduleRequest;
use App\Models\Schedule;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Collection;
use Illuminate\Support\MessageBag;

class ScheduleController extends Controller {

    /**
     * Display a listing of the schedules.
     * @return Collection
     */
    public function index(): Collection {
        return Schedule::with('users')
                       ->get();
    }

    /**
     * Store a newly created schedule in storage.
     * @param ScheduleRequest $request
     * @param CreateSchedule $createSchedule
     * @return RedirectResponse|Schedule
     */
    public function store(ScheduleRequest $request, CreateSchedule $createSchedule): RedirectResponse|Schedule {

        if ((new UserIsScheduled())->handle($request)) {
            $errors = new MessageBag();
            $errors->add('message', trans('messages.already_scheduled'));
            return redirect()
                ->back()
                ->withErrors($errors);
        }

        return $createSchedule->handle($request);
    }

    /**
     * Display the specified schedule.
     * @param Schedule $schedule
     * @return Schedule $schedule
     */
    public function show(Schedule $schedule) : Schedule {
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
    public function update(ScheduleRequest $request, Schedule $schedule) : bool|null {

    }

    /**
     * Remove the specified schedule from storage.
     * @param Schedule $schedule
     * @return bool|null
     */
    public function destroy(Schedule $schedule) : bool|null {
        //
    }
}
