/// @description Insert description here
// You can write your code in this editor



if offset <= 0
{
	alpha -= decay;

	if alpha <= 0
	{
		instance_destroy();	
	}
} else {offset--};

if !infoCopied
{
	sprite = owner.sprite_index;
	frame = owner.image_index;
	x = owner.x;
	y = owner.y;
	xMod = owner.image_xscale;
	yMod = owner.image_yscale;
	rot = owner.image_angle;
	
	infoCopied = true;
}

if blink{blinkExt(alpha, "image_alpha", 0, 60);}