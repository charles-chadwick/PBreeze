<?php

namespace App\Enums;

enum ActivityLogAction : string
{
    case Created = "Created";
    case Updated = "Updated";
    case Deleted = "Deleted";
}
