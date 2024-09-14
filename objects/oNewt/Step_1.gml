/// @description spawn GUI if none




if sodaToss = true 
{
	with (instance_create_layer(x,global.newtCenter,"Shots",oEmptyCan))
			{
				hsp = lengthdir_x(3, other.image_angle-180 + random_range(-10, 10));
				vsp =  random_range(-7, -5);
				if (sign(hsp)!=0) image_xscale = sign(hsp); 	
			}
	sodaToss = false;
}