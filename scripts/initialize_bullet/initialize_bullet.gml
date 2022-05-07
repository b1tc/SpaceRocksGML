/// @function initialize_bullet
/// @description helper function for create_bullet 
/// @arg direction
/// @arg speed
/// @arg faction
/// @arg bullet_instance


function initialize_bullet(_dir, _spd, _fac, _bul ){

	var inst = _bul;
	
	/* Whatever object is calling this function that will be the scope of the object ID
	 * and hence the "creator".  
	 * NB: The object actually calls create_bullet but the scope of id is present in this 
	 *     function as well so we do not have to pass it through the argument list.
	 */
	
	var _creator = id;
	
	with(inst)
	{
		direction = _dir;
		speed = _spd;
		faction = _fac;
		creator = _creator;
		
		 
		// Colorize Bullet According to Faction
		switch faction 
		{
			case factions.ally: image_blend = c_aqua; break;
			case factions.enemy: image_blend = c_red; break;
		}
	}


}