/// @description Choose Random Frame

// Select a random frame between 0 and 5
image_index = irandom_range(0, image_number - 1);

// set alarm[0] to go off after 5 seconds
// alarm[0] = 5 * game_get_speed(gamespeed_fps);
alarm_set(0, (game_get_speed(gamespeed_fps) * 5));

// tint the power-up image
image_blend = c_lime;

// stop the sprite frames from animating
image_speed = 0;

image_index = powerups.four_bullets;
