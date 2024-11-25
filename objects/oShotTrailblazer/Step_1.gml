/// @description



//screen pause
if screenPause() {exit;};

homingShot();
if crit {color = c_red; draw_set_color(color);};

if (place_meeting(x,y,oCollide))
{
	global.hasCrit = false;
	instance_destroy();
	outline_end();
}


