/// @description Fade and remove Debris

image_alpha -= 0.01;

if image_alpha <= 0
{
	instance_destroy();
}

