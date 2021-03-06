/// @description spawn power-up/asteroids, sfx and score

if irandom_range(0,5) == 0
{
	instance_create_layer(x,y,"Instances", obj_powerup);
}

score += 10;
audio_play_sound(snd_die, 1, false);

var _xx = x;
var _yy = y;

if sprite_index == spr_asteroid_huge
{
	global.cameraShake = 4;
	
	with(obj_particles) part_particles_create(partSys,_xx,_yy,partTypeAsteroidDebris, 12);
	
	repeat(2)
	{
		var new_asteroid = instance_create_layer(x,y,"Instances", obj_asteroid);
		new_asteroid.sprite_index = spr_asteroid_med;
	}
}
else if  sprite_index == spr_asteroid_med
{
	global.cameraShake = 2;
	
	with(obj_particles) part_particles_create(partSys,_xx,_yy,partTypeAsteroidDebris, 7);
	
	repeat(2)
	{
		var new_asteroid = instance_create_layer(x,y,"Instances", obj_asteroid);
		new_asteroid.sprite_index = spr_asteroid_small;
	}
}
else // smallest asteroid case added for global.cameraShake
{
	global.cameraShake = 1;
	
	with(obj_particles) part_particles_create(partSys,_xx,_yy,partTypeAsteroidDebris, 3);
}


make_debris_field();
