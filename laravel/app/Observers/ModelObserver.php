<?php

namespace App\Observers;

use App\Enums\ActivityLogActions;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;

/**
 * The model that watched the database tables for changes, and logs appropriately
 *
 * */
class ModelObserver {
    public function creating(Model $model): Model {

    }

    public function created(Model $model): void {

        activity('db-operations')
            ->performedOn($model)
            ->causedBy(auth()->user())
            ->log(ActivityLogActions::Created->value);
    }

    public function updating(Model $model): Model {

    }

    public function updated(Model $model): void {
        activity('db-operations')
            ->performedOn($model)
            ->causedBy(auth()->user())
            ->withProperty('old', $model->getOriginal())
            ->log(ActivityLogActions::Updated->value);
    }

    public function deleted(Model $model): void {

        activity('db-operations')
            ->performedOn($model)
            ->causedBy(auth()->user())
            ->log(ActivityLogActions::Deleted->value);
    }
}
