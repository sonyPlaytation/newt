
function _drawNewt()
{
	var _finalX;
	if (onWall != 0 and !onGround) {_finalX = drawXscale*onWall}else _finalX = drawXscale*facingRight;
	
	draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	_finalX,
	drawYscale,
	rot,
	image_blend,
	image_alpha);
}
_drawNewt()

var scale = 2; 

if oAmmoCount.lowAmmo
{
	drawSetText(c_black,fSign,fa_center,fa_bottom)
	
	draw_text_transformed(oNewt.x-2,oNewt.y-45,oAmmoCount.ammoString,scale,scale,0);
	draw_text_transformed(oNewt.x+2,oNewt.y-45,oAmmoCount.ammoString,scale,scale,0);
	draw_text_transformed(oNewt.x,oNewt.y-47,oAmmoCount.ammoString,scale,scale,0);
	draw_text_transformed(oNewt.x,oNewt.y-43,oAmmoCount.ammoString,scale,scale,0);
	
	draw_set_color(#eb445a);
	draw_text_transformed(oNewt.x,oNewt.y-45,oAmmoCount.ammoString,scale,scale,0);
}

//draw_text_transformed(oNewt.x,oNewt.y-45,string(visdist),scale,scale,0);
//draw_text_transformed(oNewt.x,oNewt.y-70,string(hsp),scale,scale,0);

if (flash > 0)
{
	flash--;
	shader_set(shWhiteFlash);
	_drawNewt();
	shader_reset();
}

//if (lit > 0)
//{
//	lit--;
//	shader_set(shGunShot);
//	_drawNewt();
//	shader_reset();
//}