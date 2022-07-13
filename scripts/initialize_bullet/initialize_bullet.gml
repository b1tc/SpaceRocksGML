/// @function initialize_bullet
/// @description helper function for create_bullet 
/// @arg direction
/// @arg speed
/// @arg faction
/// @arg bullet_instance


function initialize_bullet(_dir, _spd, _fac, _bul ){

	var inst = _bul;
	
	var _creator = id;
	
	with(inst)
	{
		direction = _dir;
		if (object_index == obj_bullet) speed = _spd;
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