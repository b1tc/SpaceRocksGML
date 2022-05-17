/// @description Key Selection and Movement

if keyboard_check(vk_left)
{
	image_angle += 5;
}

if keyboard_check(vk_right)
{
	image_angle -= 5;
}

if keyboard_check(vk_up)
{
	motion_add(image_angle,0.05);
	
	// particle fx (every 4 frames)
	exhaustCounter++;
		if exhaustCounter >= 4
		{
			var len = sprite_height * 0.4;
			var _xx = x - lengthdir_x(len, image_angle);
			var _yy = y - lengthdir_y(len, image_angle);
			with(obj_particles)
			{
				part_particles_create(partSys, _xx, _yy, partTypeExhaust, 1);
			}
		exhaustCounter = 0;
		}
}

if keyboard_check_pressed(vk_space)
{
	//create_bullet(image_angle, bulletSpd, faction, guns);
	stt_create_bullet(image_angle, bulletSpd, faction, guns);

}

move_wrap(true, true, sprite_width/2);