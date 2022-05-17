/// @description Bot Behavior

event_inherited();

// make sure obj_ship exists otherwise exit
if !instance_exists(obj_ship) exit; 

if point_distance(x,y, obj_ship.x, obj_ship.y) < 250
// if player is in range
{
	// turn to face player ship
	var new_angle = point_direction(x,y,obj_ship.x, obj_ship.y);
	new_angle = image_angle - angle_difference(image_angle, new_angle);
	image_angle = lerp(image_angle, new_angle, 0.1);
	
	// fire bullet every 60 frames (1 second)
	bulletCounter++;
	if bulletCounter > 60
	{
		//create_bullet(image_angle,4,faction);
		stt_create_bullet(image_angle,4,faction);
		bulletCounter = 0;
	}
}
else 
// otherwise no change (rotate back to original direction)
{
	image_angle = lerp(image_angle, direction, 0.1);
}
