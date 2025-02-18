<?php /** @noinspection ALL */

namespace App\Actions\Contacts;
use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class CreateContact
{
    /**
     * Handle the create contact action
     * @todo Exception handling / abstract class generation
     * @param Request $request
     * @return Contact
     */
    public function handle(Request $request) : Contact {

        $data = $request->validated();
        $data['on'] = App::make("App\\Models\\".$request->get('on'))::class;


        return Contact::create(
            $data
        );
    }
}
