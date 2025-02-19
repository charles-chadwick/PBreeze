<?php

namespace App\Enums;

use App\Traits\EnumToArray;

enum AppointmentStatus : string
{
    use EnumToArray;

    case Cancelled = "Cancelled";
    case Completed = "Completed";
    case Confirmed = "Confirmed";
    case Pending = "Pending";
    case Rescheduled = "Rescheduled";
    case Scheduled = "Scheduled";
}
