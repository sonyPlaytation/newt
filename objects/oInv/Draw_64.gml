

var _third = hpMax/3;
var _twoThird = hpMax - _third;

draw_sprite_ext(sHealthMax,hpMax-1,cornerDist,cornerDist,scale,scale,0,c_white,1);

if hp <= _third
{
	draw_sprite_ext(sHealthLow,max(0,oInv.hp),cornerDist,cornerDist,scale,scale,0,c_white,1);
}
else
if hp <= _twoThird
{
	draw_sprite_ext(sHealthMid,max(0,oInv.hp),cornerDist,cornerDist,scale,scale,0,c_white,1);
}
else draw_sprite_ext(sHealthHigh,max(0,oInv.hp),cornerDist,cornerDist,scale,scale,0,c_white,1);

draw_sprite_ext(sInvStomach,full,cornerDist,cornerDist,scale,scale,0,c_white,1);