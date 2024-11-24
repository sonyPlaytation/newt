/// @description Insert description here
// You can write your code in this editor

if place_meeting(x,y,pPhysProp) and (prop == noone) and (propBuffer <= 0)
{
	prop = instance_place(x,y,pPhysProp);	
	with prop {captured = true; depth = oNewt.depth-25};
}
