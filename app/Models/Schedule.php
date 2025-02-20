<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Schedule extends Base {
	
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
		"type",
		"date",
		"start",
		"end",
		"location",
		"title",
		"description"
	];
	
	/**
	 * @var string[]
	 */
	protected array $sort = [
		"type"        => "Type",
		"date"        => "Date",
		"start"       => "Start Time",
		"end"         => "End Time",
		"location"    => "Location",
		"title"       => "Title",
		"description" => "Description"
	];
	
	/**
	 * Construct the Schedule
	 *
	 * @param array $attributes
	 */
	public function __construct(array $attributes = []) {
		parent::__construct($attributes);
	}
	
	/**
	 * Users relationship
	 *
	 * @return BelongsToMany
	 */
	public function users(): BelongsToMany {
		return $this->belongsToMany(User::class, "schedule_users")
					->using(ScheduleUser::class)
					->withPivot(
						[
							"created_at",
							"updated_at",
							"deleted_at",
							"created_by",
							"updated_by",
							"deleted_by"
						]
					)
					->withTimestamps();
	}
}
