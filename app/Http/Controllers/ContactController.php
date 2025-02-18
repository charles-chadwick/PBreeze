<?php /** @noinspection ALL */

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
     *
     * @return Collection
     */
    public function index(): Collection {

        return Contact::sort()
            ->with("contactable")
            ->where("on", User::class)
            ->where('on_id', request('on_id'))
            ->get();
    }

    /**
     * Store a newly created contact in storage.
     *
     * @param StoreContactRequest $request
     * @param CreateContact $createContact
     * @return Contact
     */
    public function store(StoreContactRequest $request, CreateContact $createContact): Contact {
        return $createContact->handle($request);
    }

    /**
     * Retrieve the specified contact from storage
     *
     * @param Contact $contact
     * @return Contact
     */
    public function show(Contact $contact): Contact {
        return $contact->load('user');
    }

    /**
     * Update the specified contact in storage.
     *
     * @param UpdateContactRequest $request
     * @param Contact $contact
     * @param UpdateContact $updateContact
     * @return bool|null
     */
    public function update(UpdateContactRequest $request, Contact $contact, UpdateContact $updateContact): ?bool {
        return $updateContact->handle($request, $contact);
    }

    /**
     * Remove the specified contact from storage.
     * @param Contact $contact
     * @return bool|null
     */
    public function destroy(Contact $contact): ?bool {
        return $contact->delete();
    }
}
