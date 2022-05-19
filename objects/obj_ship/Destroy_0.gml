/// @description Self, Update Score, Run Debris

lives -= 1;

with(obj_game)
{
	alarm[1] = game_get_speed(gamespeed_fps);	
}

audio_play_sound(snd_hurt, 1, false);
make_debris_field();

// pfx 
var _xx = x;
var _yy = y;
var _ib = image_blend;
with(obj_particles)
{
	part_particles_create_color(partSys, _xx, _yy, partTypeShipDebris, _ib, 10);
}



