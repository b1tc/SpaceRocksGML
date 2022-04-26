/// @description Create Asteroids

// Added to assure that we inherit factions.neutral from parent!
event_inherited();

// Original Create Event Initialization
sprite_index = choose(spr_asteroid_small, spr_asteroid_med, spr_asteroid_huge);

direction = irandom_range(0,359);
image_angle = irandom_range(0,359);

speed = 1;

image_blend = make_colour_hsv(20, 255, 200);
