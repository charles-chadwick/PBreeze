# User Flow

This is just a brain dump of what happens when specific types of users are created. 

## Standard User
- Create record in user table with temp password.
- Allow them to reset their password. 

## Patient
- Create record in user table with type Patient
- Create record in patient table with basic demographics
- Optionally email the patient. (This only applies if the portal is functional).