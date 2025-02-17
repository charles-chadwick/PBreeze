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
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
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

    public function __construct(array $attributes = []) {
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
     * @var string[]
     */
    protected $appends = [
        'full_name'
    ];

    public function fullName() : Attribute {
        return Attribute::make(
            get: function($value, $attribute) {
                return $attribute['first_name']." ".$attribute['last_name'];
            }
        );
    }

    /**
     * Relationships
     */
    public function patient(): HasOne {
        return $this->hasOne(Patient::class);
    }

    public function contacts() : MorphMany {
        return $this->morphMany(Contact::class, 'user', 'on', 'on_id');
    }
}
