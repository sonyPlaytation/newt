/// @description spawn GUI if none


if sodaToss = true 
{
	with (instance_create_layer(x,global.newtCenter,"Player",oEmptyCan))
	{
		image_index = other.sodaGot;
		var physX = lengthdir_x(3, -other.image_xscale + random_range(-10, 10));
		var physY = lengthdir_y(10, random_range(-7, -5));
		physics_apply_impulse(x,y,physX,physY);
		
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

#region old coll events

	if place_meeting(x,y,oKillPlane)
	{
		audio_play_sound(snGetBall,500,0);
		hsp = 0;
		vsp = -4
		x = xstart;
		y =ystart-10;
	}
	
#endregion

if prop != noone
{
	oInv.spdMod = clamp(oInv.spdNorm-prop.phy_mass/1000,0.65,1.00);
	sprSPD = oInv.spdMod;
}
else oInv.spdMod = oInv.spdNorm;