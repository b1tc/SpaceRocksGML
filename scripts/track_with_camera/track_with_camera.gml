/// @function track_with_camera(viewport,target)
/// @description track object with camera
/// @arg viewport
/// @arg target

function track_with_camera(argument0, argument1)
{
	var viewport = argument0;
	var target = argument1;
	
	if instance_exists(target)
	{
		// Keep in mind that cameras are anchored to top left
		// so we have to shift our camera to the center.
		 global.cameraX = target.x - global.cameraWidth/2;
		 global.cameraY = target.y - global.cameraHeight/2;
	 
		 // clamp camera so room wrap is smoother
		 global.cameraX = clamp(global.cameraX, 0, room_width-global.cameraWidth);
		 global.cameraY = clamp(global.cameraY, 0, room_width-global.cameraHeight);
	}

	// Camera Shake
	global.cameraX += random_range(-global.cameraShake, global.cameraShake);
	global.cameraY += random_range(-global.cameraShake, global.cameraShake);
	
	// reset camera shake
	if global.cameraShake > 0
	{
		global.cameraShake -= 0.2;
		if (global.cameraShake < 0) global.cameraShake = 0;
	}

	// Set Camera Position
	camera_set_view_pos(viewport,global.cameraX, global.cameraY);
}