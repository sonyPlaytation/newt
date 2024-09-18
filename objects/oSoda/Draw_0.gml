/// @description Insert description here
// You can write your code in this editor

draw_self();

if (instance_exists(oNewt)) and (point_in_circle(oNewt.x,oNewt.y,x,y,48)) and (oInv.sodas <= 0) and !broke
{
	if input_check_pressed("up")
	{
		audio_play_sound(snBoowomp,900,false);
		broke = true;
	}
}

if broke
{
	drawSetText(c_black,fKaren,fa_center,fa_bottom);
	draw_text(x,y-100,"You're broke.");	
}

