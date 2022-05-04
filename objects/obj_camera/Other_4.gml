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

// Make sure our instance exists before we track it with our camera once
// before Room Start Event to avoid collisions with asteroids when
// target = obj_ship instansiates in room.
track_with_camera(view_camera[0], target);
 
 
// initialize display 
displayScale = 2;
displayWidth = global.cameraWidth * displayScale;
displayHeight = global.cameraHeight * displayScale;

window_set_size(displayWidth,displayHeight);
surface_resize(application_surface,displayWidth,displayHeight);

// GUI
display_set_gui_size(global.cameraWidth,global.cameraHeight);


// center display in monitor 
// must be executed after one step or frame so need an alarm
alarm_set(0,1);