/// @description Camera Follow Player

// Follow Target

/*
 * Remember that obj_camera is a persistent object that runs at Room Start in
 * every room of our game BUT obj_ship only exists in rm_game. Therefore,
 * we have to check to make sure our instance exists before we track it with our camera.
 */

track_with_camera(view_camera[0], target);

//TRACK WITH CAMERA OLD PROCEDURE
//if instance_exists(target)
//{
//	// Keep in mind that cameras are anchored to top left
//	// so we have to shift our camera to the center.
//	 global.cameraX = target.x - global.cameraWidth/2;
//	 global.cameraY = target.y - global.cameraHeight/2;
	 
//	 // clamp camera so room wrap is smoother
//	 global.cameraX = clamp(global.cameraX,0,room_width-global.cameraWidth);
//	 global.cameraY = clamp(global.cameraY,0,room_width-global.cameraHeight);
//}

// camera_set_view_pos(view_camera[0],global.cameraX, global.cameraY); 
