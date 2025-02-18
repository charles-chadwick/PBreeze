<?php

namespace App\Http\Controllers;

use App\Actions\Contacts\CreateContact;
use App\Actions\Contacts\UpdateContact;
use App\Http\Requests\StoreContactRequest;
use App\Http\Requests\UpdateContactRequest;
use App\Models\Contact;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class ContactController extends Controller {
    /**
     * Display a listing of the resource.
     */
    public function index(): Collection {
        return Contact::with('user')
            ->where('on', User::class)
            ->where('on_id', request('user_id'))
            ->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreContactRequest $request, CreateContact $createContact): Contact {
        return $createContact->handle($request);
    }

    /**
     * Display the specified resource.
     */
    public function show(Contact $contact): Contact {
        return $contact->load('user');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateContactRequest $request, Contact $contact, UpdateContact $updateContact): ?bool {
        return $updateContact->handle($request, $contact);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Contact $contact): ?bool {
        return $contact->delete();
    }
}
