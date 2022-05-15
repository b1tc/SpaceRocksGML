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
	
	/*
	 *	  d : _dir, direction from the parameter list of the function.
	 *	  s : [16,12,0,7,7], separation used in lengthdir_x and lengthdir_y. NB: we added 16 to the array for the default 
	 *		   single bullet case. This moves the bullet origin from the interior of the ship sprite to the nozzle or nose cone.
	 *		   The other numbers determined by FriendlyCosmonaut were assigned to _sep in each case (s replaces _sep.
	 *	  g : _gun_type + 1, from the parameter list, _gun_type can be -1, 0, 1, 2, 3 and corresponds to the powerups enum.
	 *		   Adding 1 to _gun_type gives us a number that we can use to index the s array.
	 *   _x : x is the global x value of the object calling this function.
	 *   _y : x is the global y value of the object calling this function.
	 *   xx : function() { return _x + lengthdir_x(s[g], d);}, this function calulates the x position of a powerup's guns.
	 *   yy : function() { return _y + lengthdir_y(s[g], d);}, this function calulates the y position of a powerup's guns.
	 * inst : function() { return instance_create_layer(xx(), yy(), "Instances", obj_bullet);}, this function returns the
	 *		   bullet instance to be added to a powerup gun.
	 *
	 * Index Determination:
	 * 
	 *			s : [16, 12, 0, 7, 7]
	 *				 -1,  0, 1, 2, 3	<-- _gun_type as determined by the powerup enumerator and default condition in optional argument
	 *				  0,  1, 2, 3, 4  <-- real array index = _gun_type + 1
	 *				  1,  2, 3, 4, 8  <-- number of bullets for selected gun
	 *
	 *
	 */
	
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

	// local vars used in a repeat loop 
	//    i is the loop counter 
	//    n is the number of times to loop
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
				// must reset to original _dir otherwise stt_bullet.d will accumulate 
				// and stt_bullet.xx and stt_bullet.yy calculations will be incorrect
				stt_bullet.d = _dir;
				i += 1;
			}
			
		break;
		
		case powerups.four_bullets:
		case powerups.star_bullets:
		
			// if the real array index == 3 then n = 4 for 4 bullet gun else we are in case 8 bullet and n = 8
			n = (stt_bullet.g == 3) ? 4 : 8;
			i = 0; repeat(n)
			{
				// if the real array index == 3 choose 4 bullet direction else choose 8 bullet direction
				stt_bullet.d = (stt_bullet.g == 3) ? stt_bullet.d + (i * 90) : stt_bullet.d + (i * 45);
				initialize_bullet(stt_bullet.d, _spd, _fac, stt_bullet.inst());
				// must reset to original _dir otherwise stt_bullet.d will accumulate and stt_bullet.xx 
				// and stt_bullet.yy calculations will be incorrect
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

