// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wrap(_value, _min, _max){
	/// @description Wrap(value, min, max)
	/// @function Wrap
	/// @param value
	/// @param min
	/// @param max
	// Returns the value wrapped, values over or under will be wrapped around

	if (_value mod 1 == 0)
	{
		while (_value > _max || _value < _min)
		{
			if (_value > _max)
				_value += _min - _max - 1;
			else if (_value < _min)
				_value += _max - _min + 1;
		}
		return(_value);
	}
	else
	{
		var vOld = _value + 1;
		while (_value != vOld)
		{
			vOld = _value;
			if (_value < _min)
				_value = _max - (_min - _value);
			else if (_value > _max)
				_value = _min + (_value - _max);
		}
		return(_value);
	}
}

function wave(_from, _to, _dur, _offset = 1){
	//Wave(from, to, duration, offset)

	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly

	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)

	a4 = (_to - _from) * 0.5;
	return _from + a4 + sin((((current_time * 0.001) + _dur * _offset) / _dur) * (pi*2)) * a4;	
}