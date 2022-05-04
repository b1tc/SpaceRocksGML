/// @description Self, Update Score, Run Debris

lives -= 1;

with(obj_game)
{
	alarm[1] = game_get_speed(gamespeed_fps);	
}

audio_play_sound(snd_hurt, 1, false);
make_debris_field();


