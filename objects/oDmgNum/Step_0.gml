/// @description Insert description here
// You can write your code in this editor

if alpha == 1 
{
	//if instance_exists(oMultiWeapon) {if (!oMultiWeapon.automatic == true) {hitStop(1);}}
};

alpha-= 0.01;

if instance_exists(owner)
{
	if maxHP == 0 {maxHP = owner.maxHP};
	x = owner.x;
	y = owner.y-sprite_height*1.5;
}
else
{
	x = x;
	y = y -0.3;	
}