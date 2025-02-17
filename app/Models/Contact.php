<?php

/**
 * What needs to happen when a contact is added?
 * - Validate data
 * - Check to see if address already exists for this person
 * - Add record
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Contact extends Base {

    protected $fillable = [
        'on',
        'on_id',
        'type',
        'title',
        'address_1',
        'address_2',
        'city',
        'state',
        'zip',
    ];

    public function __construct(array $attributes = []) {
        parent::__construct($attributes);
    }

    public function user(): MorphTo {
        return $this->morphTo("user", "on", "on_id");
    }

    public function addressExists($user, $address): bool {
        return $this->where("on_id", $user)
            ->where("address_1", $address['address_1'])
            ->where("address_2", $address['address_2'])
            ->where("city", $address['city'])
            ->where("state", $address['state'])
            ->where("zip", $address['zip'])
            ->exists();
    }
}
