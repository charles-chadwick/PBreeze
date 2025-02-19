<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Appointment extends Base {

    /**
     * @var string[]
     */
    protected $appends = [];

    /**
     * @var string[]
     */
    protected $casts = [];

    /**
     * @var string[]
     */
    protected $fillable = [
        'patient_id',
        'schedule_id',
        'status',
        'date_of_service',
        'comments'
    ];

    /**
     * @var string[]
     */
    protected array $sort = [
        'status'          => "Status",
        'date_of_service' => "Date Of Service",
        'comments'        => "Comments"
    ];

    /**
     * Construct the Appointment
     *
     * @param array $attributes
     */
    public function __construct(array $attributes = []) {
        parent::__construct($attributes);
    }

    /**
     * The patient relationship
     *
     * @return BelongsTo
     */
    public function patient(): BelongsTo {
        return $this->belongsTo(Patient::class);
    }

    /**
     * The schedule relationship
     *
     * @return BelongsTo
     */
    public function schedule(): BelongsTo {
        return $this->belongsTo(Schedule::class);
    }

}
