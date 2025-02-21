<?php

namespace App\Enums;

/**
 * Different types of activity log actions
 */
enum ActivityLogAction: string {
	
	case Created = "Created";
	case Updated = "Updated";
	case Deleted = "Deleted";
	
}
