/// @description Camera setup in each room.

// initialize camera location
global.cameraX = 0;
global.cameraY = 0;

// initialize the object the camera will follow
target = obj_ship;

// initialize camera width and height
global.cameraWidth = 500;
global.cameraHeight = 500;

// initialize camera and viewport
view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0],global.cameraWidth,global.cameraHeight);

if instance_exists(target)
{
	// Keep in mind that cameras are anchored to top left
	// so we have to shift our camera to the center.
	 global.cameraX = target.x - global.cameraWidth/2;
	 global.cameraY = target.y - global.cameraHeight/2;
	 
	 // clamp camera so room wrap is smoother
	 global.cameraX = clamp(global.cameraX,0,room_width-global.cameraWidth);
	 global.cameraY = clamp(global.cameraY,0,room_width-global.cameraHeight);
}


// initialize display 
displayScale = 2;
displayWidth = global.cameraWidth * displayScale;
displayHeight = global.cameraHeight * displayScale;

window_set_size(displayWidth,displayHeight);
surface_resize(application_surface,displayWidth,displayHeight);

// GUI
display_set_gui_size(global.cameraWidth,global.cameraHeight);


// center display in monitor (must be executed after on step so need an alarm).
alarm_set(0,1);