<?php

namespace App\Actions;

use App\Enums\UserRole;
use App\Models\User;
use Illuminate\Http\Request;

class UpdateUser {
	
	/**
	 * Update a user in the database
	 *
	 * @param Request $request
	 * @param User    $user
	 * @return User
	 */
	public function handle (Request $request, User $user): User {
		
		// create the user
		$user->update($request->validated());
		
		// is this a patient? if so, update the patient stuff
		if ($request->get('role') === UserRole::Patient->value) {
			$user->load('patient');
			$user->patient()
				 ->update([
					 'dob'    => $request->validated('dob'),
					 'gender' => $request->validated('gender'),
				 ]);
		}
		
		return $user;
	}
	
}
