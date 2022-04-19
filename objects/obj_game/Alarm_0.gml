/// @description Spawn Asteroids 


// Don't make asteroids in other rooms
if room != rm_game
{
	exit;
}

// Spawn 1 additional asteroid (every second)
spawn_off_camera(obj_asteroid,1);


// repeat alarm every 1 seconds
alarm[0] = game_get_speed(gamespeed_fps) * 1;

 