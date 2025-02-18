<?php

namespace App\Actions\Contacts;
use App\Models\Contact;
use Illuminate\Http\Request;

class UpdateContact
{
    public function handle(Request $request, Contact $contact) {

        return $contact->update($request->validated());
    }
}
