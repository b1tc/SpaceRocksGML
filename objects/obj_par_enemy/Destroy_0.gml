/// @description sfx, debris, score

audio_play_sound(snd_die, 1, false);

repeat(10) 
{ 
	instance_create_layer(x,y,"Instances", obj_debris); 
}

switch object_index
{
	case obj_raider: score += 15; break;
	case obj_hunter: score += 30; break;
	case obj_brute: score += 50; break;
}
