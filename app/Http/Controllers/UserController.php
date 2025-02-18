<?php /** @noinspection ALL */

namespace App\Http\Controllers;

use App\Enums\UserRole;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class UserController extends Controller {

    /**
     * Show all the users
     * @return Collection
     */
    public function index(): Collection {

        // if the role is not present, then default to all but patients
        // if the role is set, then figure out which relationships to load based on that.
        // @TODO: Move this into actions
        $relationships = [];

        $where_in = request('role', UserRole::allStaff());
        if (request('role') === UserRole::Patient->value) {
            $where_in = UserRole::Patient->value;
            $relationships = ['patient'];
        }

        return User::whereIn('role', collect($where_in))
            ->with($relationships)
            ->orderBy(request('sort', 'first_name'), request('dir', 'ASC'))
            ->get();

    }

    /**
     * Store the user
     * @param StoreUserRequest $request
     * @return User
     */
    public function store(StoreUserRequest $request): User {

        // create the user
        $user = User::create($request->validated());

        // if this is a patient, add the data
        // @TODO: offload this to an event or action
        if ($request->get('role') === UserRole::Patient->value) {
            $user->load('patient');
            $user->patient()
                ->create([
                    'dob'    => $request->validated('dob'),
                    'gender' => $request->validated('gender'),
                ]);
        }

        return $user->load('patient');
    }

    /**
     * Update the user
     * @param UpdateUserRequest $request
     * @param User $user
     * @return User
     */
    public function update(UpdateUserRequest $request, User $user) {

        // create the user
        $user->update($request->validated());

        // is this a patient? if so, update the patient stuff
        if ($request->get('role') === UserRole::Patient->value) {
            $user->load('patient');
            $user->patient()->update([
                'dob'    => $request->validated('dob'),
                'gender' => $request->validated('gender'),
            ]);
        }

        return $user;
    }

    /**
     * Show the user
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
     * @param User $user
     * @return bool|null
     */
    public function destroy(User $user) {
        return $user->delete();
    }
}
