/// @description Insert description here
// You can write your code in this editor

//float anim
y = ystart+sin(get_timer()/500000) *5;
image_angle = sin(get_timer()/100000) *5;

//equip wand
if (instance_exists(oNewt)) and instance_nearest(x,y,oNewt) and (point_in_circle(oNewt.x,oNewt.y,x,y,48))
{
	var randSoda = irandom(4);
	
	audio_sound_pitch(snBurp,random_range(0.8,1.2));
	audio_play_sound(snBurp,1000,false)
	
	if randomWand {sodaGet(randSoda); weapon = randSoda}else sodaGet(weapon);
	
	oNewt.sodaToss = true;
	oNewt.sodaDesc = oGame.desc[weapon];
	oNewt.headerAlpha = 3;
	instance_destroy();
	
}

image_index = weapon;