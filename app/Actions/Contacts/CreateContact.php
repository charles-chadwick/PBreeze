<?php /** @noinspection ALL */

namespace App\Actions\Contacts;
use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class CreateContact
{
    public function handle(Request $request) : Contact {

        $data = $request->validated();
        $data['on'] = App::make("App\\Models\\".$request->get('on'))::class;

        // @TODO: fire exception if the above class doesn't exist

        return Contact::create(
            $data
        );
    }
}
