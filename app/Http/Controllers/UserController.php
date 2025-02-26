<?php
/** @noinspection ALL */

namespace App\Http\Controllers;

use App\Actions\StoreUser;
use App\Actions\UpdateUser;
use App\Enums\UserRole;
use App\Http\Requests\UserRequest;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\View\View;

class UserController extends Controller {
	
	/**
	 * Show all the users
	 *
	 * @return Collection
	 */
	public function index (): View {
		
		$users = User::byRole(request('role'))
				   ->sort()
				   ->get();
		
		return view('users.index', compact('users'));
		
	}
	
	/**
	 * Store the user
	 *
	 * @param UserRequest $request
	 * @return User
	 */
	public function store (UserRequest $request, StoreUser $storeUser): User {
		
		return $storeUser->handle($request);
	}
	
	/**
	 * Update the user
	 *
	 * @param UpdateUserRequest $request
	 * @param User              $user
	 * @return User
	 */
	public function update (UserRequest $request, User $user, UpdateUser $updateUser): User {
		
		return $updateUser->handle($user, $request);
	}
	
	/**
	 * Show the user
	 *
	 * @param User $user
	 * @return User
	 */
	public function show (User $user): User {
		
		if ($user->role === UserRole::Patient->value) {
			$user->load('patient');
		}
		
		return $user;
	}
	
	/**
	 * Delete the user
	 *
	 * @param User $user
	 * @return bool|null
	 */
	public function destroy (User $user): bool|null {
		
		return $user->delete();
	}
	
}
