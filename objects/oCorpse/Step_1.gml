/// @description Insert description here
// You can write your code in this editor
if !corpsePicked
{
	switch(corpse)
	{
		case("generic"):
			flash = 3;
			hsp = 0;
			vsp = -5;
			grv = 0.3;
		
			sprite_index = sEWalkerDie;
			hsp = lengthdir_x(3,direction);
			vsp = lengthdir_y(3,direction)-4;
			if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
			corpsePicked = true;
		break;

		case "bat":
			hp = 9999;
			vsp = 1;
			hsp = irandom_range(-0.5,0.5);
			spd = 1;
			flash = 3;
			grv = 0.2;
			
		
		break;
	}
	corpsePicked = true;
}





