/// @description Insert description here
// You can write your code in this editor

myDamage = instance_create_layer(x,y,"GUI",oDmgNum);
with (myDamage)
{
	owner = other.id		
}

diedFrom = noone;