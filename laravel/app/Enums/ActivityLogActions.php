<?php

namespace App\Enums;

enum ActivityLogActions : string
{
    case Created = "created";
    case Updated = "updated";
    case Deleted = "deleted";
}
