

/// @description move to next room

var done = false;
vsp += grv;

//vertical collision
if !done and (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oCollSemi))
{
	while (!place_meeting(x,y+sign(vsp),oCollide)) and (!place_meeting(x,y+vsp,oCollSemi))
	{
		y += sign(vsp)
	}
	vsp = 0;
	done = true;
}
y += vsp;

if instance_exists(oSoda) {sprite_index = sDoorHall};

if place_meeting(x,y,oNewt)
{
	oExclam.image_index = 2;
	oNewt.exclam = true;
	
	if input_check_pressed("up")
	{
		//global.roomscleared +=1;
		with (oNewt)
		{
			if (hasControl)
			{
				other.image_index = 1;
				hasControl = false;	
				inspect = true;
				
				//if global.roomscleared == 3{oExitDoor.target = rTest1; global.roomscleared = 0}
				
				slideTransition(TRANS_MODE.GOTO,other.target)
								
				oSFX.enterleveldoor = true;
			}
		}
	}
}