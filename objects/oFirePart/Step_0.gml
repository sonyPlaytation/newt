/// @description Insert description here
// You can write your code in this editor

image_xscale -= 0.1;
image_yscale -= 0.1;

if instance_exists(owner)image_angle = owner.image_angle;

if image_xscale < 0.1 instance_destroy();