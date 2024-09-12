function playerDie(){

	with (oInv) instance_destroy();
	with (oExclam) instance_destroy();
	with (oHealthBar) instance_destroy();
	with (oAmmoCount) instance_destroy();


	with(instance_create_layer(x,y, layer, oGunDead))
		{

			hsp = lengthdir_x(3, direction);

			vsp = lengthdir_y(3, direction)-2;

			if (sign(hsp)!=0) image_xscale = sign(hsp); 	
		}

	instance_change(oDead,true);

	direction = point_direction(other.x,other.y,x,y);
	hsp = lengthdir_x(6,direction);
	vsp = lengthdir_y(4,direction)-2;

	global.killsthisroom = 0;
	oGame.combotimer = 0;
}