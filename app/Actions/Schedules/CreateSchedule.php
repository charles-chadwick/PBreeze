<?php

namespace App\Actions\Schedules;

use App\Models\Schedule;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CreateSchedule {

    public function handle(Request $request) {

        /**
         * Check the availability for this user/date/start-end
         * If bad, return error message
         * Maybe this should be a custom validate function? Or I can do that here, too
         */
        Schedule::with('users')
            ->where('date', $request->get('date'))
            ->where('start', $request->get('start'))
            ->where('end', $request->get('end'))
            ->get();
    }
}
