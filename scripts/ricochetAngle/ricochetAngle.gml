// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ricochetAngle(_wall, _shot , _dir){

	

	if _dir < 45 || _dir >315 //right side, flip x speed
	{_shot.xspd = lengthdir_x(spd, -dir)}

	if _dir > 45 && _dir < 135 //top side, flip y speed
	{_shot.yspd = lengthdir_y(spd, -dir);}

	if _dir > 135 && _dir < 225 //left side, flip x speed
	{_shot.xspd = lengthdir_x(spd, -dir)}

	if _dir > 225 && _dir < 315 //bottom side, flip y speed
	{_shot.yspd = lengthdir_y(spd, -dir);}



}