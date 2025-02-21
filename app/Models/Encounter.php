<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Encounter extends Base {
	
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
		"appointment_id",
		"patient_id",
		"type",
		"status",
		"date",
		"title",
		"content"
	];
	
	/**
	 * @var string[]
	 */
	protected array $sort = [
		"type"    => "Type",
		"status"  => "Status",
		"title"   => "Title",
		"date"    => "Date",
		"content" => "Content",
	];
	
	/**
	 * Construct the Encounter
	 *
	 * @param array $attributes
	 */
	public function __construct (array $attributes = []) {
		
		parent::__construct($attributes);
	}
	
	/**
	 * Appointment relationship
	 * @return BelongsTo
	 */
	public function appointment () : BelongsTo {
		return $this->belongsTo(Appointment::class);
	}
	
	/**
	 * Patient relationship
	 * @return BelongsTo
	 */
	public function patient () : BelongsTo {
		return $this->belongsTo(Patient::class);
	}
}
