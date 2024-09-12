/// @description Insert description here
// You can write your code in this editor


draw_sprite(sWeaponGlow,imageGO,x,y);

image_xscale = 0.75;
image_yscale = 0.75;

if randomWand
{
	shader_set(shSilhouette);
	draw_self();
	shader_reset();
}else draw_self();