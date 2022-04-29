/// @description create_bullet
/// @arg direction
/// @arg speed
/// @arg faction


	function create_bullet(argument0, argument1, argument2)
	{
	var _dir = argument0;
	var _spd = argument1;
	var _fac = argument2;
	
	// whatever object is calling this function that will be the scope of the object ID
	// and hence the "creator".
	var _creator = id;

	audio_play_sound(snd_zap, 1, false);
	var inst = instance_create_layer(x, y,"Instances", obj_bullet);
	
	 
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



