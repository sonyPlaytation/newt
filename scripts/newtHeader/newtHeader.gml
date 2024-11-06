///@args text
///@args alpha
function newtHeader(argument0, argument1)
{
	if instance_exists (oNewt)
	{
		with oNewt 
		{
			sodaDesc = argument0;
			headerAlpha = argument1;
		}
	}
}

function systemMsg(argument0, argument1, argument2)
{
	if instance_exists (oNewt)
	{
		if argument2 {audio_play_sound(snSuperHeal,999,false)};
		with oGame 
		{
			sysMsg = argument0;
			systemAlpha = argument1;
		}
	}
}