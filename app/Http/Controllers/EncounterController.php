<?php

namespace App\Http\Controllers;

use App\Actions\Encounters\StoreEncounter;
use App\Actions\Encounters\UpdateEncounter;
use App\Http\Requests\EncounterRequest;
use App\Models\Encounter;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class EncounterController extends Controller {
	
	/**
	 * Show a listing of all Encounter
	 *
	 * @return Collection
	 */
	public function index (): Collection {
		
		return Encounter::with([ 'patient', 'appointment' ])
						->get();
	}
	
	/**
	 * Store a/an encounter record
	 *
	 * @param EncounterRequest $request
	 * @return Encounter
	 */
	public function store (EncounterRequest $request): Encounter {
		
		return Encounter::create($request->validated());
	}
	
	/**
	 * Update a/an encounter record
	 *
	 * @param EncounterRequest $request
	 * @param Encounter        $encounter
	 * @return bool
	 */
	public function update (EncounterRequest $request, Encounter $encounter): bool {
		
		return $encounter->update($request->validated());
	}
	
	/**
	 * Show a/an encounter record
	 *
	 * @param Encounter $encounter
	 * @return Encounter
	 */
	public function show (Encounter $encounter): Encounter {
		
		return $encounter;
	}
	
	/**
	 * Delete a/an encounter record
	 *
	 * @param Encounter $encounter
	 * @return bool|null
	 */
	public function destroy (Encounter $encounter): bool|null {
		
		return $encounter->delete();
	}
	
}
