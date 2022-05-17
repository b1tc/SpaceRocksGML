/// @description sfx, debris, score

audio_play_sound(snd_die, 1, false);
make_debris_field();

// particle fx 
var len = sprite_height * 0.4;
var _xx = x;
var _yy = y;
var _ib = image_blend;
with(obj_particles)
{
	part_particles_create_color(partSys, _xx, _yy, partTypeShipDebris, _ib, 10);
}


global.cameraShake = 4;

switch object_index
{
	case obj_raider: score += 15; break;
	case obj_hunter: score += 30; break;
	case obj_brute: score += 50; break;
}

if irandom_range(0,1) == 0
{
	instance_create_layer(x,y,"Instances", obj_powerup);
}


