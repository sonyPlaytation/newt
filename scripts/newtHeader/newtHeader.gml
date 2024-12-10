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

function systemMsg( _msg = "DEFAULT TEXT DO NOT LOOK" , _alpha = 3, _SFX = false)
{

	if _SFX {audio_play_sound(snSuperHeal,999,false)};
	with oGame 
	{
		sysMsg = _msg;
		systemAlpha = _alpha;
	}
	
}