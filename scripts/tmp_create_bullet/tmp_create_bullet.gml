/// @function create_bullet
/// @description Create bullet(s) when the space key is pressed
/// @arg direction
/// @arg speed
/// @arg faction

function tmp_create_bullet(_dir, _spd, _fac, _gun_type = -1)
{

	audio_play_sound(snd_zap, 1, false);
	// whatever object is calling this function that will be the scope of the object ID
	// and hence the "creator".
	//var _creator = id;
	
	//show_debug_message(string( _gun_type));
	
	
	/***This may be a BUG!***/
	// If we do not declare the variables used in the struct as local then they will be at the instance level of the object 
	// instance referenceing the function.  Because, what if want to add a variable to the struct?
	// We would have to declare it first then add it:
	// var newvar;
	// bullet_struct.newvar = some_value;
	
	// struct members
	var d,s,g,xd,yd, m, _x, _y, sg;
	
	var mystruct = 
	{
		d : _dir,
		s : [16,12,0,7,7],
		g : _gun_type + 1,
	   sg : function() { return s[g];},
	   _x : x,
	   _y : y,
	   xd : function() { return _x + lengthdir_x(s[g], d);},
	   yd : function() { return _y + lengthdir_y(s[g], d);},
	   
		//m : function() {return _x + lengthdir_x(s[g], d);}

	   //xd : function(s,g,d) 
		//	{ 
		//		return x + lengthdir_x(s[g], d);
		//	},
	   //yd : function(s,g,d) 
		//	{ 
		//		 return y + lengthdir_y(s[g], d);
		//	}
	};
	
		//var tmp = typeof( mystruct.xd() ;
	//show_debug_message( mystruct.sg());


	
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
				//bullet_angle = _dir + (i * 45);
				//xx = x + lengthdir_x(_sep, bullet_angle);
				//yy = y + lengthdir_y(_sep, bullet_angle);
				
				xx = x + lengthdir_x(_sep, _dir + (i * 45));
				yy = y + lengthdir_y(_sep, _dir + (i * 45));
				
				inst = instance_create_layer(xx, yy, "Instances", obj_bullet);
				//initialize_bullet(bullet_angle, _spd, _fac, inst);
				initialize_bullet( _dir + (i * 45), _spd, _fac, inst);
				i += 1;
			}
		break;
		
		case powerups.laser_cannon:
		break;
		
		// the default can also be case -1:
		// but it makes sense to put this as the default 
		default:
		
			//_sep = 16;
			//xx = x + lengthdir_x(_sep, _dir);
			//yy = y + lengthdir_y(_sep, _dir);
		
			//inst = instance_create_layer(xx, yy, "Instances", obj_bullet);
			inst = instance_create_layer(mystruct.xd(), mystruct.yd(), "Instances", obj_bullet);
			initialize_bullet(_dir, _spd, _fac, inst);

		break;
	}

	delete mystruct;

}

