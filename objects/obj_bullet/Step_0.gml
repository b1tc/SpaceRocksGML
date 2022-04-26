/// @description Destroy Bullet

var p1 = global.cameraX;
var p2 = global.cameraY;
var p3 = global.cameraX + global.cameraWidth;
var p4 = global.cameraY + global.cameraHeight;

if !point_in_rectangle(x, y, p1, p2, p3, p4) 
{
	instance_destroy();
}
