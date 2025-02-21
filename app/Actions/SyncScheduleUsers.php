<?php

namespace App\Actions;
use App\Models\Schedule;
use App\Models\ScheduleUser;
use Illuminate\Http\Request;

class SyncScheduleUsers
{
    public function handle(Request $request, Schedule $schedule) : void {
		
		/**
		 * For the life of me, I could NOT figure out how to sync users with my timestamps and logging in the
		 * model observers. So I did it the crappy way. Sorry.
		 */
		
		// get the user ids we want to add/update, and the ones we want to soft-delete
		$user_ids_to_add_or_update = collect($request->get('user_id'))->toArray();
		$user_ids_to_remove = $schedule->users()
									   ->newPivotQuery()
									   ->whereNotIn('user_id', $user_ids_to_add_or_update)
									   ->pluck('user_id')
									   ->toArray();
		
		// soft-delete the items we don't want.
		ScheduleUser::whereNotIn('user_id', $user_ids_to_add_or_update)
					->delete();
		
		// updateOrCreate the ones we do want
		foreach($user_ids_to_add_or_update as $user_id) {
			ScheduleUser::updateOrCreate([
				'user_id' => $user_id,
				'schedule_id' => $schedule->id
			]);
		}
    }
}
