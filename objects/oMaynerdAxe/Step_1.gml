/// @description

if (parried or friendly) and !stateChange
{
	friendly = 1
	var go = 15;
	vsp = lengthdir_y(go,oWeapon.image_angle);
	hsp = lengthdir_x(go,oWeapon.image_angle);
	spd = 1;	
	grv = 0.2;
	damage = 50;
	
	stateChange = true;
}