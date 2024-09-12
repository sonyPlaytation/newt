///@args variable
///@args variableString
///@args endVar
///@args duration
///@args [pulseFactor]

function blinkExt(){


var _id = id;

var _factor;
if (argument_count > 4) _factor = argument[4];
else _factor = 1;

var _blinker = instance_create_depth(0,0,0, oBlinkFX);

with (_blinker)
	{
		variable = argument[0];
		variableString = argument[1];
		endVar = (argument[2] > 0);
		duration = argument[3];
		
		owner = _id;
		pulseFactor = _factor;
		
		var _time = min(pulseFactor * 60, duration);
		alarm[0] = ceil(0.2 * _time);
		alarm[1] = duration;
	
	}

return (_blinker);

}