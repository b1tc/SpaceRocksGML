/// @function create_bullet
/// @description Create bullet(s) when the space key is pressed
/// @arg direction
/// @arg speed
/// @arg faction

function create_bullet(_dir, _spd, _fac, _gun_type = -1)
{

	// whatever object is calling this function that will be the scope of the object ID
	// and hence the "creator".
	//var _creator = id;

	// Choose Gun Type
	switch _gun_type
	{
		case powerups.three_bullets:
			var inst = instance_create_layer(x, y, "Instances", obj_bullet);
			initialize_bullet(_dir, _spd, _fac, inst);
		
		case powerups.two_bullets:
			audio_play_sound(snd_zap, 1, false);
			
			var _sep = 12;
			
			var inst = instance_create_layer(x + lengthdir_x(_sep, _dir + 90), y + lengthdir_y(_sep, _dir + 90), "Instances", obj_bullet);
			initialize_bullet(_dir, _spd, _fac, inst);
			
			var inst = instance_create_layer(x + lengthdir_x(_sep, _dir - 90), y + lengthdir_y(_sep, _dir - 90), "Instances", obj_bullet);
			initialize_bullet(_dir, _spd, _fac, inst);
		break;
		
		case powerups.four_bullets:
			audio_play_sound(snd_zap, 1, false);
			
			var _sep = 7;
			var bullet_angle;
			
			var i = 0; repeat(4)
			{
				bullet_angle = _dir + (i * 90);
				var inst = instance_create_layer(x + lengthdir_x(_sep , bullet_angle), y + lengthdir_y(_sep, bullet_angle), "Instances", obj_bullet);
				initialize_bullet(bullet_angle, _spd, _fac, inst);
				i += 1;
			}
		break;
		
		case powerups.star_bullets:
			audio_play_sound(snd_zap, 1, false);
			
			var _sep = 7;
			var bullet_angle;
			
			var i = 0; repeat(8)
			{
				bullet_angle = _dir + (i * 45);
				var inst = instance_create_layer(x + lengthdir_x(_sep , bullet_angle), y + lengthdir_y(_sep, bullet_angle), "Instances", obj_bullet);
				initialize_bullet(bullet_angle, _spd, _fac, inst);
				i += 1;
			}
		break;
		
		case powerups.laser_cannon:
		break;
		
		// the default can also be case -1:
		// but it makes sense to put this as the default 
		default:
			audio_play_sound(snd_zap, 1, false);
			var inst = instance_create_layer(x, y, "Instances", obj_bullet);
			initialize_bullet(_dir, _spd, _fac, inst);
		break;
	}

}













