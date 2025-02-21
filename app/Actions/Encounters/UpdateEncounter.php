<?php

namespace App\Actions\Encounters;
use App\Models\Encounter;
use Illuminate\Http\Request;

class UpdateEncounter
{
    public function handle(Request $request, Encounter $encounter) : bool {
		return $encounter->update($request->validated());
    }
}
