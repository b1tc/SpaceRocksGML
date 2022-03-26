/// @description Ship Hits Asteroid
//Fires when Ship Bounding Box hits Asteroid Bounding Box

lives -= 1;

// Ship destroy's itself.
instance_destroy();

repeat(10)
{
	instance_create_layer(x,y,"Instances", obj_debris);
}