<?php

use App\Http\Controllers\AppointmentController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\ScheduleController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::resource('users', UserController::class);
Route::resource('contacts', ContactController::class);
Route::resource('schedules', ScheduleController::class);
Route::resource('appointments', AppointmentController::class);
