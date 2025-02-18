<?php

namespace App\Actions\Schedules;
use App\Models\Schedule;
use Illuminate\Database\Query\Builder;
use Illuminate\Http\Request;

class UserIsScheduled
{
    public function handle(Request $request): bool {

        return Schedule::with('users', function(Builder $query) use ($request) {
                $query->whereIn('user_id', $request->get('user_id'));
            })
            ->where('date', $request->get('date'))
            ->where('start', $request->get('start'))
            ->where('end', $request->get('end'))
            ->count() > 0;
    }
}
