<?php

namespace App\Http\Controllers;

use App\Actions\Schedules\CreateSchedule;
use App\Actions\Schedules\UserIsScheduled;
use App\Http\Requests\ScheduleRequest;
use App\Http\Requests\UpdateScheduleRequest;
use App\Models\Schedule;
use Illuminate\Support\MessageBag;

class ScheduleController extends Controller {
    /**
     * Display a listing of the resource.
     */
    public function index() {
        return Schedule::with('users')
            ->get();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(ScheduleRequest $request, CreateSchedule $createSchedule) {

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
     * Display the specified resource.
     */
    public function show(Schedule $schedule) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Schedule $schedule) {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateScheduleRequest $request, Schedule $schedule) {
        return $updateScheduleRequest->handle($request);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Schedule $schedule) {
        //
    }
}
