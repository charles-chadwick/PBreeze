<?php

use App\Http\Controllers\AppointmentController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\EncounterController;
use App\Http\Controllers\ScheduleController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::resource('appointments', AppointmentController::class);
Route::resource('contacts', ContactController::class);
Route::resource('encounters', EncounterController::class);
Route::resource('schedules', ScheduleController::class);
Route::resource('users', UserController::class);