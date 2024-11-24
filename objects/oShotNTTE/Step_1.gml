/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

if (place_meeting(x,y,pEntity)) and (pEntity.inactive == false)
{
	with(instance_place(x,y,pEntity))
	{
		hp -= oWeapon.damage;
		
		if (!noDMG)
		{
			myDamage.damage += oWeapon.damage;
			myDamage.alpha = 1;
			myDamage.dmgTextScale = 0.75
		}
		
		flash = 3;
		hitfrom = other.direction;
		if (hitsound != -1)	oSFX.scientistscream = true;
	}
	instance_destroy();
}

if (place_meeting(x,y,oCollide)) && (image_index != 0) instance_destroy();



