/// @description Bullet Hits Asteroid

// Destroy Bullet
instance_destroy();

with(other)
{
	// Destroy Asteroid ('other' destroys itself)
	instance_destroy();	
	
	if sprite_index == spr_asteroid_huge
	{
		repeat(2)
		{
			var new_asteroid = instance_create_layer(x,y,"Instances", obj_asteroid);
			new_asteroid.sprite_index = spr_asteroid_med;
		}
	}
	else if  sprite_index == spr_asteroid_med
	{
		repeat(2)
		{
			var new_asteroid = instance_create_layer(x,y,"Instances", obj_asteroid);
			new_asteroid.sprite_index = spr_asteroid_small;
		}
	}
		repeat(10) 
		{ 
			instance_create_layer(x,y,"Instances", obj_debris); 
		}
}
