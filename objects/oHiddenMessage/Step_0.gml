/// @description Insert description here
// You can write your code in this editor






if instance_exists(oNewt) and place_meeting(x,y,oNewt)
{
	with(mytext)
	{
	alpha = min(alpha+0.05, 1);
	}
}

if instance_exists(oNewt) and !place_meeting(x,y,oNewt)
{
	with(mytext)
	{
	alpha = max(alpha-0.10, 0);
	}
}

