<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

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
		'start',
		'end',
		'title',
		'comments'
	];
	
	/**
	 * @var string[]
	 */
	protected array $sort = [
		'status'   => "Status",
		'start'    => "Start",
		'end'      => "End",
		'title'    => "Title",
		'comments' => "Comments"
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
	public function schedule(): HasOne {
		return $this->hasOne(Schedule::class);
	}
	
	/**
	 * The users relationship
	 *
	 * @return BelongsToMany
	 */
	public function users(): BelongsToMany {
		return $this->belongsToMany(ScheduleUser::class, 'schedule_users', 'schedule_id', 'user_id')
					->as('appointment_users')
					->withPivotValue([ 'created_at' ])
					->withTimestamps();
	}
	
}
