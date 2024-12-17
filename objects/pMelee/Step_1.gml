/// @description Insert description here
// You can write your code in this editor

if instance_exists(oNewt)
{

	hit = false;

	x = oNewt.x;
	y = global.newtCenter;

	//screen pause
	if screenPause() {exit;};

	state();

};

