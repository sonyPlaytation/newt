/// @description Insert description here
// You can write your code in this editor

if !instance_exists(oMelon){melonTimer--};
if melonTimer = 0{instance_create_layer(x,bbox_top-50,layer,oMelon);melonTimer = 300;}

sprite_index = sDummyBody;
vsp = vsp + grv;

//vertical collision
if (place_meeting(x,y+vsp,oCollide))
{
	while (!place_meeting(x,y+sign(vsp),oCollide)) 
	{
		y += sign(vsp)
	}
	vsp = 0;
	if !instance_exists(myWall)
	{
		myWall = instance_create_layer(x,y,layer,oCollideMiddle);
		myWall.image_alpha = 0.5;
		
		with (myWall)
		{
			xspd = 0;
			yspd = 0;
			owner = other.id
			image_xscale = other.sprite_width / sprite_width +0.90 ;
			image_yscale = 0.5 ;
		}
	}
	
}

y += vsp;







if (vsp != 0) and (place_meeting(x,y,oNewt))
{
	hp = 0;
	oNewt.vsp = 0;
	audio_play_sound(snBump,300,false);
}

if (hp<=0) 
{

	oSFX.potterybreak = true;
	instance_destroy();
	
	
	if (irandom_range(1,100) <= dropRate)
	{
		instance_create_layer(x,y,layer,dropType);
		instance_nearest(x,y,dropType).vsp = -3;
		
	}
	
	if (irandom_range(1,49) <= ghostChance)
	{
		
		repeat(multiplier)
		{
			expGive();
			instance_create_layer(x,y,layer,oSpookyGhost)
		};
	}
	
	repeat(12)
	{
		with instance_create_layer(x,bbox_bottom, "Player", oDust)
		{
			
			depth -= 15;
			
		}
	}
}
