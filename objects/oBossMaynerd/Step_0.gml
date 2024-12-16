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
	
	if (phase == 1) and hp < (maxHP/2)
	{
		phase = 2;	
	}
	
	state();
	
	
}