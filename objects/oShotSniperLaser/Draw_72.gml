/// @description Insert description here
// You can write your code in this editor
if instance_exists(oNewt)
{
	var gun = oMultiWeapon
	switch(oMultiWeapon.sprite)
	{
		case sWandAWP:
	
			if gun.altfire == "scope" and (gun.showLaser = true)
			{
				image_alpha = 1 -(abs(oNewt.hsp)/20);
				gun.headshots = true 
				image_index = 1;
			} 
			else 
			{
				image_alpha = 0;
				gun.headshots = false
				image_index = 0;
			};

			draw_self();
			image_angle = gun.image_angle + (random_range(-oNewt.hsp/2,oNewt.hsp/2)/5);
			x = gun.x+lengthdir_x(gun.length,image_angle); 
			y = gun.y+lengthdir_y(gun.length,image_angle); 
			depth = gun.depth+1;
			image_xscale = point_distance(x,y,mouse_x,mouse_y);
			image_yscale = 1.5;
		break;
		
		case sWandKiller7:
	
			if gun.altfire == "scope" and (gun.showLaser = true)
			{
				//laser ON
				gun.ammouse = 2;
				gun.accuracy = 0;
				gun.cooldown = 16;
				gun.image_index = 1;
				gun.headshots = true;
				gun.cancrit = false;
			} 
			else 
			{
				//laser OFF
				gun.ammouse = 1;
				gun.accuracy = 6;
				gun.cooldown = 9;
				gun.image_index = 0;
				gun.headshots = false;
				gun.cancrit = true; 
			};
		break;
	}
	
}else instance_destroy();

