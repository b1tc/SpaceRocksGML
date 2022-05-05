/// @description collision

/**Ship Hits Faction**/

// check if object is member of our faction 
if (other.faction == faction) 
// if our faction then exit
{
	exit;
}
// check if are we invincible
else if (invincible)
{
	// the other object takes damge
	with(other)
	{
		event_perform(ev_other, ev_user1); 
	}
	// exit to avoid running default case below
	exit;
}


// default case: 
// not our faction and we are not invincible
// therefore the other object takes damge
event_perform(ev_other, ev_user1); 
