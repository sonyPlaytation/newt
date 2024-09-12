/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

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
		myWall.image_alpha = 1;
		
		with (myWall)
		{
			xspd = 0;
			yspd = 0;
			owner = other.id
			image_xscale = other.sprite_width / sprite_width +0.5;
			image_yscale = 0.75 ;
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
	with (myWall) instance_destroy();
	
	repeat(35)
	{
		with instance_create_layer(x,bbox_bottom-(sprite_height/2), "Player", oBlood)
		{
			oSFX.goremain = true;
			depth -= 15;
		}
	
	}
	
	instance_destroy();
}
