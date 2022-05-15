/// @description sfx, debris, score

audio_play_sound(snd_die, 1, false);
make_debris_field();


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
