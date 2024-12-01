/// @description Insert description here
// You can write your code in this editor

if (input_check("up") or input_check("down") ) and collision_circle(x,y,48,pPhysProp,0,0) and (prop == noone) and (propBuffer <= 0)
{
	prop = instance_nearest(x,y,pPhysProp);	
	with prop {captured = true; depth = oNewt.depth-25};
}
