/// @function spawn_off_camera(object,number)
/// @description spawn object number times off the camera
/// @arg obj
/// @arg number

function spawn_off_camera(argument0, argument1)
{
	var obj = argument0;
	var num = argument1;
	
	// spawn point
	var xx, yy;
	
	// padding around camera to accomodate large asteroids  
	var pad = 64;  
   
	repeat(num)
	{
		xx = random_range(0,room_width);
		yy = random_range(0,room_height);
		
		var r1 = global.cameraX - pad;
		var r2 = global.cameraY - pad;
		var r3 = global.cameraX + global.cameraWidth + pad;
		var r4 = global.cameraY + global.cameraHeight + pad;
	
	
		while ( point_in_rectangle(xx, yy, r1, r2, r3, r4) )
		{
			xx = random_range(0,room_width);
			yy = random_range(0,room_height);
		}
		
		instance_create_layer(xx,yy,"Instances",obj);
	}
}
