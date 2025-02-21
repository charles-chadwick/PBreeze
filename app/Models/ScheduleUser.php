<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\Concerns\AsPivot;
use Illuminate\Database\Eloquent\Relations\Pivot;

class ScheduleUser extends Base
{
    use AsPivot;

    protected $table = 'schedule_users';

    /**
     * Indicates if the IDs are auto-incrementing.
     *
     * @var bool
     */
    public $incrementing = true;

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array<string>|bool
     */
    protected $guarded = [];
	
	protected $fillable = [
		'schedule_id',
		'user_id'
	];

    public function __construct(array $attributes = []) {
        parent::__construct($attributes);
    }
	
	public function schedule(): BelongsTo {
		return $this->belongsTo(Schedule::class);
	}
	
	public function user(): BelongsTo {
		return $this->belongsTo(User::class);
	}
}
