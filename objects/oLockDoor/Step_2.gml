

/// @description move to next room

if instance_exists(oNewt)
{
	if place_meeting(x,y,oNewt)
	{
		if input_check_pressed("up")
		{
			with (oNewt)
			{
				if (hasControl)
				{
					oSFX.doorstuck = true;
				}
			}
		}
	
		//debug room reload
		if input_check_pressed("special") and global.debug
		{
			with (oNewt)
			{
				if (hasControl)
				{
					slideTransition(TRANS_MODE.GOTO,room);
				}
			}
		}
	}
}