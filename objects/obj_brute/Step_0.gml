/// @description Bot Behavior

event_inherited();

// update sprite image_index based on HP
image_index = HP - 1;

// make sure obj_ship exists otherwise exit
if !instance_exists(obj_ship) exit; 

// if player is in range
if point_distance(x,y, obj_ship.x, obj_ship.y) < 250
{
	// turn to face player ship
	var new_angle = point_direction(x,y,obj_ship.x, obj_ship.y);
	new_angle = image_angle - angle_difference(image_angle, new_angle);
	image_angle = lerp(image_angle, new_angle, 0.1);
		
	// move toward player
	direction = image_angle;  
	
	//increase speed every frame it is chasing player
	speed += 0.01;
}
else 
// otherwise no change (set back to original speed)
{
	speed = lerp(speed, originalSpeed, 0.1);
}
