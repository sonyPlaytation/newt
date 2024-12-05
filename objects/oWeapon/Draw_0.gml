/// @description Insert description here
// You can write your code in this editor

if instance_exists(oNewt)
{
	if !oNewt.inspect
	{
		draw_sprite_ext(
		sprite_index,
		image_index,
		x-lengthdir_x(current_recoil,image_angle),
		y-lengthdir_y(current_recoil,image_angle),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
		);
	}
}



