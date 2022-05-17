/// @description for particle sfx

// particle fx (every 4 frames)
exhaustCounter++;
	if exhaustCounter >= 4
	{
		var len = sprite_height * 0.4;
		var _xx = x - lengthdir_x(len, image_angle);
		var _yy = y - lengthdir_y(len, image_angle);
		with(obj_particles)
		{
			part_particles_create(partSys, _xx, _yy, partTypeEnemyExhaust, 1);
		}
	exhaustCounter = 0;
	}
