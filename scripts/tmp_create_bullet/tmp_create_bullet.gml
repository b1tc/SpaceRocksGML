/// @function tmp_create_bullet
/// @description Create bullet(s) when the space key is pressed
/// @arg direction
/// @arg speed
/// @arg faction

function tmp_create_bullet(_dir, _spd, _fac, _gun_type = -1)
{

	audio_play_sound(snd_zap, 1, false);
	
	// stt_bullet struct members
	var d, s, g, _x, _y, xx, yy, inst;
	
	var stt_bullet = 
	{
		d : _dir,
		s : [16,12,0,7,7],
		g : _gun_type + 1,
	   _x : x,
	   _y : y,
	   xx : function() { return _x + lengthdir_x(s[g], d);},
	   yy : function() { return _y + lengthdir_y(s[g], d);},
	 inst : function() { return instance_create_layer(xx(), yy(), "Instances", obj_bullet);}
	};

	// local vars used in the repeat loop
	var i, n;
	
	// Choose Gun Type
	switch _gun_type
	{
		case powerups.three_bullets:

			initialize_bullet(_dir, _spd, _fac, stt_bullet.inst());
			
			// set gun type to 1 for fall through to next case
			stt_bullet.g = 1;
	
		case powerups.two_bullets:
		
			i = 0; repeat(2)
			{
				stt_bullet.d = (i == 0) ? stt_bullet.d + 90 : stt_bullet.d - 90;
				initialize_bullet(_dir, _spd, _fac, stt_bullet.inst());
				stt_bullet.d = _dir;
				i += 1;
			}
			
		break;
		
		case powerups.four_bullets:
		case powerups.star_bullets:
		
			n = (stt_bullet.g == 3) ? 4 : 8;
			
			i = 0; repeat(n)
			{
				stt_bullet.d = (stt_bullet.g == 3) ? stt_bullet.d + (i * 90) : stt_bullet.d + (i * 45);
				initialize_bullet(stt_bullet.d, _spd, _fac, stt_bullet.inst());
				stt_bullet.d = _dir;
				i += 1;
			}
			
		break;
		
		case powerups.laser_cannon:
			// handled with separate object
		break;
		
		// the default can also be case -1:
		// but it makes sense to put this as the default 
		default:
		
			initialize_bullet(_dir, _spd, _fac, stt_bullet.inst());

		break;
	}

	delete stt_bullet;

}

