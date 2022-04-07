/// @description Camera setup in each room.

// initialize camera location
cameraX = 0;
cameraY = 0;

// initialize the object the camera will follow
target = obj_ship;

// initialize camera width and height
cameraWidth = 500;
cameraHeight = 500;

// initialize camera and viewport
view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0],cameraWidth,cameraHeight);

// initialize display 
displayScale = 2;
displayWidth = cameraWidth * displayScale;
displayHeight = cameraHeight * displayScale;

window_set_size(displayWidth,displayHeight);
surface_resize(application_surface,displayWidth,displayHeight);

// GUI
display_set_gui_size(cameraWidth,cameraHeight);


// center display in monitor (must be executed after on step so need an alarm).
alarm_set(0,1);