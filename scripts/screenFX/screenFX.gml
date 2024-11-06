function screenPause()
{
	//pause self
	if instance_exists(oHstop)
	{
		image_speed = 0;
		return true;
	}
	else
	{
		image_speed = 1;
		return false;
	}
}

///@args mode
///@args target
function slideTransition(argument0, argument1)
{
	with(oTransition)
	{	
	mode = argument[0];
	if (argument_count > 1) target = argument[1];
	}
}

///@args magnitude
///@args frames
function screenShake(_magnitude,_frames)
{
	with(oCamera)
	{
		if (_magnitude > shake_remain)
		{
			shake_mag = _magnitude;
			shake_remain = _magnitude;
			shake_length = _frames;
		}
	}
}

///@args frames
function hitStop(argument0)
{
	if argument0 == undefined{argument0 = 3;}
	global.hitFrames = argument0;
	with instance_create_depth(0,0,0,oHstop)
	{
		if global.hitStopOn{
			stopFrames = global.hitFrames;
		}
	};
}