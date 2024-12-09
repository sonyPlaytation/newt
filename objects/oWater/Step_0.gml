/// @description

if place_meeting(x,y,oNewt)
{
	
	with (oNewt)
	{
		if state != stateSwim
		{
			state = stateSwim;
			drawXscale = backwards;
			drawYscale = backwards;
		}
	}
}