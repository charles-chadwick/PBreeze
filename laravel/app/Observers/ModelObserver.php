<?php

namespace App\Observers;

use App\Enums\ActivityLogActions;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;

/**
 * The model that watched the database tables for changes, and logs appropriately
 *
 * @TODO: Change the user in ->causedBy() to reflect the auth user
 */
class ModelObserver {
    public function creating(Model $model): Model {
        if (!isset($model->created_by)) {
            $model->setAttribute('created_by', auth()->id());
        }

        return $model;
    }

    public function created(Model $model): void {

        activity('db-operations')
            ->performedOn($model)
            ->causedBy(auth()->user())
            ->log(ActivityLogActions::Created->value);
    }

    public function updating(Model $model): Model {
        $model->setAttribute('updated_by', auth()->id());
        return $model;
    }

    public function updated(Model $model): void {
        activity('db-operations')
            ->performedOn($model)
            ->causedBy(auth()->user())
            ->withProperty('old', $model->getOriginal())
            ->log(ActivityLogActions::Updated->value);
    }

    public function deleted(Model $model): void {

        $model->setAttribute('deleted_by', auth()->id());
        $model->save();

        activity('db-operations')
            ->performedOn($model)
            ->causedBy(auth()->user())
            ->log(ActivityLogActions::Deleted->value);
    }
}
