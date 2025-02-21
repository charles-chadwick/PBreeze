<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Enums\UserRole;
use Database\Factories\UserFactory;
use Illuminate\Auth\MustVerifyEmail;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\MorphOne;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Base implements
	AuthenticatableContract,
	AuthorizableContract,
	CanResetPasswordContract {
	
	use \Illuminate\Auth\Authenticatable, Authorizable, CanResetPassword, MustVerifyEmail;
	
	public function __construct (array $attributes = []) {
		
		parent::__construct($attributes);
	}
	
	/**
	 * Get the attributes that should be cast.
	 *
	 * @return array<string, string>
	 */
	protected $casts = [
		'email_verified_at' => 'datetime',
		'password'          => 'hashed',
	];
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var list<string>
	 */
	protected $fillable = [
		'role',
		'status',
		'first_name',
		'last_name',
		'email',
		'password'
	];
	
	/**
	 * The attributes that should be hidden for serialization.
	 *
	 * @var list<string>
	 */
	protected $hidden = [
		'password',
		'remember_token',
	];
	
	/**
	 * Attributes
	 *
	 * @var string[]
	 */
	protected $appends = [
		'full_name'
	];
	
	public function fullName (): Attribute {
		
		return Attribute::make(
			get: function ($value, $attribute) {
				
				return $attribute[ 'first_name' ] . " " . $attribute[ 'last_name' ];
			}
		);
	}
	
	/**
	 * Sort Fields
	 *
	 * @var array|string[]
	 */
	protected array $sort = [
		"first_name"  => "First Name",
		"middle_name" => "Middle Name",
		"last_name"   => "Last Name",
		"email"       => "Email"
	];
	
	/**
	 * Contacts
	 *
	 * @return MorphMany
	 */
	public function contacts (): MorphMany {
		
		return $this->morphMany(Contact::class, 'contactable', 'on', 'on_id');
	}
	
	/**
	 * Patient Relationship
	 *
	 * @return HasOne
	 */
	public function patient (): HasOne {
		
		return $this->hasOne(Patient::class);
	}
	
	/**
	 * Schedules relationship
	 *
	 * @return BelongsToMany
	 */
	public function schedules (): BelongsToMany {
		
		return $this->belongsToMany(Schedule::class, "schedule_users")
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
	
	/**
	 * @param Builder $query
	 * @param         $role
	 * @return Builder
	 */
	public function scopeByRole (Builder $query, $role): Builder {
		
		//  load data by role
		if ($role === UserRole::Patient->value) {
			$query->where('role', UserRole::Patient->value)
				  ->with('patient');
		}
		else {
			$query->whereIn('role', compact($role == null ? UserRole::allStaff() : $role));
		}
		
		return $query;
	}
	
}
