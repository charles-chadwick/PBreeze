<?php

namespace App\Http\Controllers;

use App\Enums\UserRole;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class UserController extends Controller {

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
            ->orderBy(request('sort', 'first_name'), request('dir', 'ASC'))
            ->get();

    }

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

    public function show(User $user): User {
        return $user->load('contacts');
    }
}
