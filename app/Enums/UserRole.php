<?php

namespace App\Enums;

use App\Traits\EnumToArray;

enum UserRole : string
{
    use EnumToArray;

    case SuperAdmin = "Super Admin";
    case Doctor = "Doctor";
    case Nurse = "Nurse";
    case Staff = "Staff";
    case Patient = "Patient";

    public static function allStaff(): array {
        return [self::Doctor, self::Nurse, self::Staff];
    }
}
