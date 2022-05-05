/// @description collision

with(other)
{
	var powerup_type = image_index;	
	instance_destroy();
}

switch powerup_type
{
	case  powerups.invincible_shield:	
	// make player invincible
	invincible = true;
	// set alarm[1] to expire invincibility after 8 seconds
	alarm[1] = 8 * game_get_speed(gamespeed_fps);
	break;
	
	default:
	//change players guns
	// needed in the step event when create bullet 
	guns = powerup_type;
	// set alarm[0] to expire gun power up after 5 seconds
	alarm[0] = 5 * game_get_speed(gamespeed_fps);
	break;
}

