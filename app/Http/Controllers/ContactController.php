<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreContactRequest;
use App\Http\Requests\UpdateContactRequest;
use App\Models\Contact;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class ContactController extends Controller {
    /**
     * Display a listing of the resource.
     */
    public function index() {
        return Contact::with('user')->where('on', User::class)
            ->where('on_id', request('user_id'))
            ->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreContactRequest $request) : Contact {

        $data = $request->validated();
        $data['on'] = App::make("App\\Models\\".$request->get('on'))::class;

        return Contact::create(
            $data
        );
    }

    /**
     * Display the specified resource.
     */
    public function show(Contact $contact) {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateContactRequest $request, Contact $contact) {

        return $contact->update($request->validated());
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Contact $contact) {
        //
    }
}
