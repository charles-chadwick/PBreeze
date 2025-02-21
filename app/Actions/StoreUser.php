<?php
/** @noinspection ALL */

namespace App\Actions;

use App\Enums\UserRole;
use App\Models\User;
use Illuminate\Http\Request;

class StoreUser {
	
	/**
	 * Store a user in the database
	 *
	 * @param Request $request
	 * @return User
	 */
	public function handle (Request $request): User {
		
		// create the user
		$user = User::create($request->validated());
		
		// if this is a patient, add the data
		if ($request->get('role') === UserRole::Patient->value) {
			$user->load('patient');
			$user->patient()
				 ->create([
					 'dob'    => $request->validated('dob'),
					 'gender' => $request->validated('gender'),
				 ]);
		}
		
		return $user;
	}
	
}
