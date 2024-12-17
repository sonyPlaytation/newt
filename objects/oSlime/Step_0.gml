/// @description Insert description here
// You can write your code in this editor

event_inherited();

lengthMatters = false;

hsp*=0.9;
vsp*=0.9;

if instance_exists(oNewt) and jump
{
	vsp = irandom_range(0,oNewt.vsp);	
	hsp = irandom_range(0,oNewt.hsp);	
}