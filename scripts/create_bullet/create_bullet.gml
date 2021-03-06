/// @function create_bullet
/// @description Create bullet(s) when the space key is pressed
/// @arg direction
/// @arg speed
/// @arg faction

/***************************************************************
 * NB: This was our original function for creating bullets.
 * We replaced this function with stt_create_bullet because we 
 * wanted to use a local struct in our function.
 ***************************************************************
 */


function create_bullet(_dir, _spd, _fac, _gun_type = -1)
{
	if _gun_type == powerups.laser_cannon
	{
		audio_play_sound(snd_laser, 1, false);
	}
	else
	{
		audio_play_sound(snd_zap, 1, false);
	}
	
	
	var _sep, xx, yy, bullet_angle, inst, i;

	// Choose Gun Type
	switch _gun_type
	{
		case powerups.three_bullets:
		
			_sep = 0;
			xx = x + lengthdir_x(_sep, _dir);
			yy = y + lengthdir_y(_sep, _dir);

			inst = instance_create_layer(xx, yy, "Instances", obj_bullet);
			initialize_bullet(_dir, _spd, _fac, inst);
	
		case powerups.two_bullets:
			
			_sep = 12;
			xx = x + lengthdir_x(_sep, _dir + 90);
			yy = y + lengthdir_y(_sep, _dir + 90);

			inst = instance_create_layer(xx, yy, "Instances", obj_bullet);
			initialize_bullet(_dir, _spd, _fac, inst);
			
			xx = x + lengthdir_x(_sep, _dir - 90);
			yy = y + lengthdir_y(_sep, _dir - 90);

			inst = instance_create_layer(xx, yy, "Instances", obj_bullet);
			initialize_bullet(_dir, _spd, _fac, inst);
		break;
		
		case powerups.four_bullets:
			
			_sep = 7;
			
			var i = 0; repeat(4)
			{
				bullet_angle = _dir + (i * 90);
				xx = x + lengthdir_x(_sep, bullet_angle)
				yy = y + lengthdir_y(_sep, bullet_angle);
				
				inst = instance_create_layer(xx, yy, "Instances", obj_bullet);
				initialize_bullet(bullet_angle, _spd, _fac, inst);
				i += 1;
			}
		break;
		
		case powerups.star_bullets:
			
			_sep = 7;
			
			i = 0; repeat(8)
			{
				bullet_angle = _dir + (i * 45);
				xx = x + lengthdir_x(_sep, bullet_angle);
				yy = y + lengthdir_y(_sep, bullet_angle);

				inst = instance_create_layer(xx, yy, "Instances", obj_bullet);
				initialize_bullet(bullet_angle, _spd, _fac, inst);
				i += 1;
			}
		break;
		
		case powerups.laser_cannon:
			inst = instance_create_layer(x, y, "Instances", obj_laser);
			initialize_bullet(_dir, _spd, _fac, inst);
		break;
		
		// the default can also be case -1:
		// but it makes sense to put this as the default 
		default:
		
			_sep = 16;
			xx = x + lengthdir_x(_sep, _dir);
			yy = y + lengthdir_y(_sep, _dir);
		
			inst = instance_create_layer(xx, yy, "Instances", obj_bullet);
			initialize_bullet(_dir, _spd, _fac, inst);

		break;
	}

}

