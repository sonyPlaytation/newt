
///@func				propHandle(throw, drop)
///@desc				Can be used to force Newt to throw or drop an object
///@arg	{bool}	Throw	Force Newt to throw the object
///@arg	{bool}	Drop	Force Newt to drop the object

function propHandle(_throw = false, _drop = false){
	var _prop = oNewt.prop
	with _prop
	{
		phy_position_x = oNewt.x + lengthdir_x(36, other.image_angle);
		phy_position_y = global.newtCenter + lengthdir_y(36, other.image_angle);
				
		if (_throw or input_check_pressed("shoot")) and !place_meeting(_prop.x,_prop.y, oCollide)
		{
			oNewt.propBuffer = 15;
			_prop.captured = false;
			_prop.phy_active = true;
			oNewt.prop = noone;
					
			var _physX = lengthdir_x(4 + abs(oNewt.hsp), other.image_angle) * 1000
			var _physY = lengthdir_y(4 + abs(oNewt.vsp), other.image_angle) * 1000
									
			physics_apply_impulse(x,y,_physX-phy_mass,_physY);
		}
				
		if (_drop or input_check_pressed("interact")) and !place_meeting(_prop.x,_prop.y, oCollide)
		{
			oNewt.propBuffer = 15;
			_prop.captured = false;
			_prop.phy_active = true;
			oNewt.prop = noone;
		}
	}
}