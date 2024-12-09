/// @description Insert description here
// You can write your code in this editor

if instance_exists(owner)
{
	x = owner.x;
	y = owner.bbox_top;
	image_xscale = owner.image_xscale * width;
	image_yscale = owner.image_yscale * height;
	inactive = owner.inactive;

}else instance_destroy()


