/// @description blink variable

/*	switches the blinking variable between true and false and 
	calculates another alarm depending on how long the blinking is still inactive */

doesBlink = !doesBlink;

var _alarm2Time = 60;
if (alarm_get(1) > 0) _alarm2Time = alarm_get(1);

var _time = min(pulseFactor * 60, _alarm2Time);

alarm[0] = ceil(0.2* _time);