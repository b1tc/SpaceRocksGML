/// @description Camera Follow Player

// Follow Target

/*
 * Remember that obj_camera is a persistent object that runs at Room Start in
 * every room of our game BUT obj_ship only exists in rm_game. Therefore,
 * we have to check to make sure our instance exists before we track it with our camera.
 */

if instance_exists(target)
{
	// Keep in mind that cameras are anchored to top left
	// so we have to shift our camera to the center.
	 cameraX = target.x - cameraWidth/2;
	 cameraY = target.y - cameraHeight/2;
	 
	 // clamp camera so roomwrap is smoother
	 cameraX = clamp(cameraX,0,room_width-cameraWidth);
	 cameraY = clamp(cameraY,0,room_width-cameraHeight);
}

 camera_set_view_pos(view_camera[0],cameraX, cameraY); 
