<?php
/** @noinspection ALL */

namespace App\Http\Controllers;

use App\Actions\Users\StoreUser;
use App\Actions\Users\UpdateUser;
use App\Enums\UserRole;
use App\Http\Requests\UserRequest;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;

class UserController extends Controller {

    /**
     * Show all the users
     *
     * @return Collection
     */
    public function index(): Collection {

        // if the role is not present, then default to all but patients
        // if the role is set, then figure out which relationships to load based on that.
        $relationships = [];

        $where_in = request('role', UserRole::allStaff());
        if (request('role') === UserRole::Patient->value) {
            $where_in = UserRole::Patient->value;
            $relationships = ['patient'];
        }

        return User::whereIn('role', collect($where_in))
                   ->with($relationships)
                   ->sort()
                   ->get();

    }

    /**
     * Store the user
     *
     * @param UserRequest $request
     * @return User
     */
    public function store(UserRequest $request, StoreUser $storeUser): User {

        return $storeUser->handle($request);
    }

    /**
     * Update the user
     *
     * @param UpdateUserRequest $request
     * @param User $user
     * @return User
     */
    public function update(UserRequest $request, User $user, UpdateUser $updateUser): User {

        return $updateUser->handle($user, $request);
    }

    /**
     * Show the user
     *
     * @param User $user
     * @return User
     */
    public function show(User $user): User {

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
    public function destroy(User $user): bool|null {
        return $user->delete();
    }
}
