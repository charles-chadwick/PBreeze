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

    public function contactable(): MorphTo {
        return $this->morphTo("contactable", "on", "on_id");
    }
}
