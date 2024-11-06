/// @description spawn GUI if none


if sodaToss = true 
{
	with (instance_create_layer(x,global.newtCenter,"Shots",oEmptyCan))
			{
				image_index = other.sodaGot;
				hsp = lengthdir_x(3, other.image_angle-180 + random_range(-10, 10));
				vsp =  random_range(-7, -5);
				if (sign(hsp)!=0) image_xscale = sign(hsp); 	
			}
	sodaToss = false;
}

//mout open

if mouthOpen
{
	sprWalk = sNewtWalkM;
	sprJump = sNewtAirM;
	sprIdle = sNewtIdleM;

}
else
{
	sprWalk = sNewtWalk;
	sprJump = sNewtAir;
	sprIdle = sNewtIdle;
}

if mouthTimer > 0 {mouthTimer--;};