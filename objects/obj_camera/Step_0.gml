/// @description Camera Follow Player

// Follow Target

/*
 * Remember that obj_camera is a persistent object that runs at Room Start in
 * every room of our game BUT obj_ship only exists in rm_game. Therefore,
 * we have to check to make sure our instance exists before we track it with our camera.
 */

track_with_camera(view_camera[0], target);


// Parallax Effect
layer_x("Parallax_0", global.cameraX * 0.98);
layer_y("Parallax_0", global.cameraY * 0.98);

layer_x("Parallax_1", global.cameraX * 0.92);
layer_y("Parallax_1", global.cameraY * 0.92);

layer_x("Parallax_2", global.cameraX * 0.90);
layer_y("Parallax_2", global.cameraY * 0.90);

layer_x("Parallax_3", global.cameraX * 0.88);
layer_y("Parallax_3", global.cameraY * 0.88);


