/// @description Spawn Asteroids 


// Don't make asteroids in other rooms
if room != rm_game
{
	exit;
}

spawn_off_camera(obj_asteroid,1);

// Spawn Asteroids OLD CODE
//// flip a coin
//if choose(0,1) == 0
//{
//	// go down the side
//	var xx = choose(0, room_width);
//	var yy = irandom_range(0, room_height);
//}
//else
//{
//	// go top or bottom	
//	var xx = irandom_range(0, room_width);
//	var yy = choose(0, room_height);
//}

//instance_create_layer(xx,yy,"Instances", obj_asteroid);

// repeat alarm every 4 seconds
// changed to 1 seconds because room is larger
alarm[0] = game_get_speed(gamespeed_fps) * 1;

 