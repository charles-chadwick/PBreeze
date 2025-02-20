<?php

namespace App\Models;

use AllowDynamicProperties;
use Carbon\Carbon;
use Database\Factories\UserFactory;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Notifications\Notifiable;

class Base extends Model {

    use HasFactory, SoftDeletes;
    use Notifiable;

    protected array $sort = [];

    public function __construct(array $attributes = []) {
        parent::__construct($attributes);

        // Load in all our default attributes
        $this->appends = array_merge($this->appends, [
            'created_at_human',
            'updated_at_human',
            'updated_at_human',
        ]);

        $this->casts['created_at'] = 'datetime';
        $this->casts['updated_at'] = 'datetime';
        $this->casts['deleted_at'] = 'datetime';

        $this->fillable = array_merge($this->fillable, [
            'created_by',
            'updated_by',
            'deleted_by',
			'created_at',
            'updated_at',
            'deleted_at'
        ]);

        $this->sort = array_replace($this->sort, [
            'created_at' => 'Created At'
        ]);
    }


    /**
     * The user this record was created by
     *
     * @return BelongsTo
     */
    public function createdBy(): BelongsTo {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    /**
     * The user this record was updated by
     *
     * @return BelongsTo
     */
    public function updatedBy(): BelongsTo {
        return $this->belongsTo(User::class, 'updated_by', 'id');
    }

    /**
     * The user this record was deleted by
     *
     * @return BelongsTo
     */
    public function deletedBy(): BelongsTo {
        return $this->belongsTo(User::class, 'deleted_by', 'id');
    }

    /**
     * Human-readable format for date
     *
     * @return string
     */
    public function getCreatedAtHumanAttribute(): string {
        return Carbon::parse($this->attributes['created_at'])
            ->diffForHumans();
    }

    /**
     * Human-readable format for date
     *
     * @return string
     */
    public function getUpdatedAtHumanAttribute(): string {
        return Carbon::parse($this->attributes['updated_at'])
            ->diffForHumans();
    }

    /**
     * Human-readable format for date
     *
     * @return string
     */
    public function getDeletedAtHumanAttribute(): string {
        return Carbon::parse($this->attributes['deleted_at'])
            ->diffForHumans();
    }

    /**
     * Sort a query by a single field
     * @todo Exception if $this->sort is empty
     * @param Builder $query
     * @return Builder
     */
    public function scopeSort(Builder $query): Builder {
        $query->orderBy(request("sort", array_key_first($this->sort)), request('dir', 'ASC'));
        return $query;
    }
}
