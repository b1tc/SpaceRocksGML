/// @description Bullet Hits Faction

// Destroy Bullet (destroy self) if not part of creator  
/*
	SPECIAL NOTE from YouTube User sidraptor (Alex Smith and others):
	Due to the new update, some things are a bit broken. 
	If you are having a problem where the bullets do not exit the ship, change the following.

	In the Bullet object, Under the collission event with obj_faction, the line 
	if(other == creator) exit; should be if(other.id == creator) exit; 
	the .id must be added for it to work.
*/
if (other.id  == creator) exit;
instance_destroy();

/*----------------------------------------------------------------------
 * Check if other object we are colliding with is part of our faction
 * If the object we are colliding with is a member of our faction
 * then we don't want it to take damage.  Remember we are now using our
 * obj_bullet for all factions!
 *----------------------------------------------------------------------
 */
if (other.faction == faction) exit;

// Damage Object
with(other) event_perform(ev_other,ev_user1);
