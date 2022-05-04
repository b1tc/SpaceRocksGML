///@description make_debris_field
function make_debris_field(){

	// whatever object is calling this function that will be the scope of the object ID
	// and hence the "creator".
	var _creator = id;
	
	repeat(10)
	{
		var inst = instance_create_layer(x,y,"Instances", obj_debris);
		inst.image_blend = _creator.image_blend;
	}
}