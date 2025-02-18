<?php

namespace App\Actions\Schedules;

use App\Models\Schedule;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;

class CreateSchedule {

    /**
     * Create the schedule
     * @param Request $request
     * @return mixed
     */
    public function handle(Request $request): mixed {

        /**
         * Check the availability for this user/date/start-end
         * If bad, return error message
         */

        // create the
        $schedule = Schedule::with('users')
            ->create($request->except('user_id'));

        // add the users
        $schedule->users()
            ->attach($request->get('user_id'), [
                'created_by' => auth()->id(),
                'created_at' => now()
            ]);

        return $schedule;
    }
}
