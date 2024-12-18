


if (state != stateFree) and (state != stateSwim) {rot = 0};
// 

if prop != noone {image_speed = sprSPD * clamp(oInv.spdNorm-prop.phy_mass/1000,0.65,1.00);} else image_speed = sprSPD;

function draw_newt_ext()
{
	var _finalX;
	if (onWall != 0 and !onGround) {_finalX = drawXscale*onWall}else _finalX = drawXscale*facingRight;
	
	rot = clamp(rot,-12,12);
	image_angle = 0;
	
	draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	_finalX,
	abs(drawYscale),
	rot,
	image_blend,
	image_alpha);
}

function draw_newt()
{	
	draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	rot,
	image_blend,
	image_alpha);
}

if state = stateSwim
{
	draw_newt();
}
else
{
	draw_newt_ext();
}
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

if dashCount < dashMax and !place_meeting(x,y+2,oCollide)
{
	drawSetText(c_white,fSign,fa_center,fa_bottom);
	draw_text_transformed(oNewt.x,oNewt.y-45,string(dashCount),scale,scale,0);
}

//if prop != noone {draw_text_transformed(oNewt.x,oNewt.y-70,string(prop.phy_mass),scale,scale,0)};
//draw_text_transformed(oNewt.x,oNewt.y-90,image_speed,scale,scale,0)



draw_text(x,y-50,"meleeCombo"+string(oWeapon.combo));
//draw_text(x,y-65,"drawY"+string(drawYscale));

if (flash > 0)
{
	flash--;
	shader_set(shWhiteFlash);
	draw_newt_ext();
	shader_reset();
}

if (blood > 0)
{
	blood--;
	shader_set(shRedFlash);
	draw_newt_ext();
	shader_reset();
}

drawSetText(c_black,fKaren,fa_center,fa_middle);
draw_text_color(x,y-sprite_height-10,sodaDesc,c_black,c_black,c_black,c_black,headerAlpha);
draw_text_color(x-1,y-sprite_height-11,sodaDesc,c_white,c_white,c_white,c_white,headerAlpha*1.15);
headerAlpha -= 0.01;

draw_set_color(c_red)
if global.debug = true {draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)}; //DRAW HITBOX

//if (lit > 0)
//{
//	lit--;
//	shader_set(shGunShot);
//	_drawNewt();
//	shader_reset();
//}