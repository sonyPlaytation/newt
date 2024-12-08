/// @description

//screen pause
if screenPause() {exit;};

if phase == 0
{
	inactive = true;	
}else if (phase > 0) {inactive = false};

if !inactive and hp > 0
{
	vsp = vsp + grv;
	
	if oRoomMiddle.x < x {facing = -1} else {facing = 1};
	
	if (phase == 1) and hp < (maxHP/2)
	{
		phase = 2;	
	}
	
	state();
}