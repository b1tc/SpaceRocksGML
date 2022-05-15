/// @description Game Room

if room = rm_game
{
	// Spawn 40 Initial Asteroids
	spawn_off_camera(obj_asteroid, 40);
	
	// Spawn Enemies
	spawn_off_camera(obj_raider, 8);
	spawn_off_camera(obj_brute, 3);
	spawn_off_camera(obj_hunter, 5);
	
	// start (or restart) ambient loop
	//if audio_is_playing(msc_song)
	//{
	//	audio_stop_sound(msc_song);
	//}
	//audio_play_sound(msc_song,2,true);


	 alarm[0] = game_get_speed(gamespeed_fps);
}
