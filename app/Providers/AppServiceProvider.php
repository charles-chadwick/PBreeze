<?php

namespace App\Providers;

use App\Models\Contact;
use App\Models\Patient;
use App\Models\User;
use App\Observers\ModelObserver;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider {
    /**
     * Register any application services.
     */
    public function register(): void {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void {

        // @TODO: remove this once auth is properly implemented
        if (!app()->runningInConsole()) {
            Auth::loginUsingId(1);
        }


        // Register observers.
        User::observe([
            ModelObserver::class
        ]);
        Patient::observe([
            ModelObserver::class
        ]);
        Contact::observe([
            ModelObserver::class
        ]);
    }
}
