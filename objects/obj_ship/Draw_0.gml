/// @description draw power-up overlays

draw_self();

// draw guns
if guns != -1
{
	// draw sprite over the top of out player
	draw_sprite_ext(spr_ship_powerups, guns, x, y, 
	image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

// draw invincibility
if invincible
{
	/*
	 * alpha will always be opaque, alpha = 1, when min returns 1. 
	 * 60 frames = 1 second and 2 seconds to 8 seconds is 120 frames to 480 frames.
	 * During the last second alarm[1] is less that 60 frames.
	 * The min function returns a number, alpha < 1, causing alpha to fade.
	 */
	var alpha = min(1, alarm_get(1)/60);
	
	// draw sprite over the top of player
	draw_sprite_ext(spr_ship_powerups, powerups.invincible_shield, x, y, 
	image_xscale, image_yscale, image_angle, image_blend, alpha);
}

