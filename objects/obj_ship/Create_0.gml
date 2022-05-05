/// @description Override parent obj_faction_ally Create Event 

event_inherited();

// referenced in step event
bulletSpd = 6;

/* referenced in obj_powerup - collision event
 *	initialize guns to -1 because there is not a -1 frame
 *	initialize invincible to false because it will toggle true when picked up
 */ 
guns = -1;
invincible = false;

