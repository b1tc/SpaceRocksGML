/// @description Camera Follow Player

// Follow Target

if instance_exists(target)
{
	 cameraX = target.x - cameraWidth/2;
	 cameraY = target.y - cameraHeight/2;
	 
	 // clamp camera so roomwrap is smoother
	 cameraX = clamp(cameraX,0,room_width-cameraWidth);
	 cameraY = clamp(cameraY,0,room_width-cameraHeight);
}

 camera_set_view_pos(view_camera[0],cameraX, cameraY); 
