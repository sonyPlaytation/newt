/// @description Effects 
if !instance_exists(oNewt){destroy();}

if corpsePicked != true
{
	size = global.getSizeKilled;
	if size > 1 {big = true};
	
	switch(corpse)
	{
		case"generic":
			
			flash = 3;
			hsp = 0;
			vsp = -5;
			grv = 0.3;
		
			hsp = lengthdir_x(3,direction);
			vsp = lengthdir_y(3,direction)-4;
			if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
			corpsePicked = true;
			
			effect = "heal";
			corpse = "generic";
		break;
		
		case"wizard":
			
			flash = 3;
			hsp = 0;
			vsp = -5;
			grv = 0.3;
		
			hsp = lengthdir_x(3,direction);
			vsp = lengthdir_y(3,direction)-4;
			if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
			corpsePicked = true;
			
			effect = choose("heal","explode","ammo");
			corpse = "generic";
		break;
		
		case"golem":
			
			flash = 3;
			hsp = 0;
			vsp = -2;
			grv = 0.3;
			
			//arm
			with instance_create_depth(x-(20*image_yscale),y-24,depth-15,oGolemLimbs){image_index = 0;image_yscale = other.image_yscale};
			
			with instance_create_depth(x-(10*image_yscale),y-12,depth-15,oGolemLimbs){image_index = 1;image_yscale = other.image_yscale};
			
			with instance_create_depth(x+(10*image_yscale),y-12,depth-15,oGolemLimbs){image_index = 1;image_yscale = other.image_yscale};
			
			hsp = lengthdir_x(3,direction);
			vsp = lengthdir_y(3,direction)-4;
			if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
			corpsePicked = true;
			
			effect = "heal";
			corpse = "generic";
		break;

		case "bat":
			digest*=1.75;
			vsp = 1;
			hsp = irandom_range(-0.5,0.5);
			spd = 1;
			flash = 3;
			grv = 0.2;
			
			effect = "explode";
			corpse = "bat"
		break;
		
		case "batparry":
			digest*=1.75;
			var go = 15;
			vsp = lengthdir_y(go,oWeapon.image_angle);
			hsp = lengthdir_x(go,oWeapon.image_angle);
			spd = 1;
			flash = 3;
			grv = 0.2;
			
			effect = "explode";
			corpse = "bat"
		break;
		
		case "killer7":
			effect = "ammo";
			audio_play_sound(snK7Kill,600,false);
			timer = 30;
			
			corpse = "killer7";
		break;
	}
	corpsePicked = true;
}





