<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Contact extends Base
{
    protected $fillable = [
        'on',
        'on_id',
        'type',
        'address_1',
        'address_2',
        'city',
        'state',
        'zip',
    ];

    public function __construct(array $attributes = []) {
        parent::__construct($attributes);
    }

    public function user() : MorphTo {
        return $this->morphTo("user", "on", "on_id");
    }
}
