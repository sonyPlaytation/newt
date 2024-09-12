/// @description Insert description here
// You can write your code in this editor

//float anim
y = ystart+sin(get_timer()/500000) *5;


if (instance_exists(oNewt)) and (place_meeting(x,y,oNewt))
{
	oInv.hp = 12;
	oInv.hpMax = 12;
	audio_play_sound(snSuperHeal, 700, false);
	oGame.combotimer += 300;
	instance_destroy();
}