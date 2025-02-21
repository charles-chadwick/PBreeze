<?php
/** @noinspection ALL */

namespace App\Http\Controllers;

use App\Actions\Contacts\StoreContact;
use App\Actions\Contacts\UpdateContact;
use App\Http\Requests\ContactRequest;
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
	public function index (): Collection {
		
		return Contact::sort()
					  ->with("contactable")
					  ->where("on", User::class)
					  ->where('on_id', request('on_id'))
					  ->get();
	}
	
	/**
	 * Store a newly created contact in storage.
	 *
	 * @param ContactRequest $request
	 * @return Contact
	 */
	public function store (ContactRequest $request): Contact {
		
		$data = $request->validated();
		$data[ 'on' ] = App::make("App\\Models\\" . $request->get('on'))::class;
		
		return Contact::create(
			$data
		);
	}
	
	/**
	 * Retrieve the specified contact from storage
	 *
	 * @param Contact $contact
	 * @return Contact
	 */
	public function show (Contact $contact): Contact {
		
		return $contact->load('user');
	}
	
	/**
	 * Update the specified contact in storage.
	 *
	 * @param ContactRequest $request
	 * @param Contact        $contact
	 * @return bool|null
	 */
	public function update (ContactRequest $request, Contact $contact, UpdateContact $updateContact): ?bool {
		
		return $contact->update($request->validated());
	}
	
	/**
	 * Remove the specified contact from storage.
	 *
	 * @param Contact $contact
	 * @return bool|null
	 */
	public function destroy (Contact $contact): ?bool {
		
		return $contact->delete();
	}
	
}
