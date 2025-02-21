<?php

namespace App\Actions\Encounters;
use App\Models\Encounter;
use Illuminate\Http\Request;

class StoreEncounter
{
    public function handle(Request $request) {
		return Encounter::create($request->validated());
    }
}
