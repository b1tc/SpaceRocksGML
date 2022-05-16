/// @description Bot Behavior

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
	
	// if we are too close to the player decrease the hunter speed
	if point_distance(x,y, obj_ship.x, obj_ship.y) < 150
	{
		speed -= 0.05;
	}
	// otherwise increase speed when outside 150 radius
	else
	{
		speed += 0.01;
	}
	
	// fire bullet every 40 frames ( < 1 second)
	bulletCounter++;
	if bulletCounter > 40
	{
		//create_bullet(image_angle,8,faction);
		stt_create_bullet(image_angle,8,faction);
		bulletCounter = 0;
	}
}
else 
// otherwise no change (set back to original speed)
{
	speed = lerp(speed, originalSpeed, 0.1);
}
