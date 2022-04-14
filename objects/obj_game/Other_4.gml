/// @description Game Room

if room = rm_game
{
	// Spawn Initial Asteroids
	spawn_off_camera(obj_asteroid,40);
	
	// start (or restart) ambient loop
	//if audio_is_playing(msc_song)
	//{
	//	audio_stop_sound(msc_song);
	//}
	//audio_play_sound(msc_song,2,true);

// Spawn Initial Asteroids OLD METHOD
	//repeat(6)
	//{
	//	var xx = choose( 
	//		irandom_range(0, room_width*0.3), 
	//		irandom_range(room_width*0.3, room_width) 
	//	);
	//	var yy = choose( 
	//		irandom_range(0, room_height*0.3), 
	//		irandom_range(room_height*0.3, room_height) 
	//	);
	//	instance_create_layer(xx, yy ,"Instances", obj_asteroid);
	//}
	
	 alarm[0] = game_get_speed(gamespeed_fps);
}
