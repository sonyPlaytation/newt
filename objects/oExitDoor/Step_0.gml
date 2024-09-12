

/// @description move to next room



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
				oExitDoor.image_index = 1;
				hasControl = false;	
				
				//if global.roomscleared == 3{oExitDoor.target = rTest1; global.roomscleared = 0}
				
				slideTransition(TRANS_MODE.GOTO,oExitDoor.target)
								
				oSFX.enterleveldoor = true;
			}
		}
	}
}