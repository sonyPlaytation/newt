/// @description Insert description here
// You can write your code in this editor

if !instance_exists(myShooter) 
{
	with instance_create_depth(x,y,depth,oEShrugBat)
	{
		hp = other.hp;
		maxHP = other.maxHP;
		
		myDamage = instance_create_layer(x,y,"GUI",oDmgNum);
		with (myDamage)
		{
			owner = other.id		
		}
	}
	instance_destroy();
}

event_inherited();

