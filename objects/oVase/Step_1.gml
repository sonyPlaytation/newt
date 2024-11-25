/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};


if (hp<=0) 
{
	oSFX.potterybreak = true;
	instance_destroy();
	
	if (irandom_range(1,100) <= dropRate)
	{
		with instance_create_layer(x,y,layer,dropType){vsp-=3};
	}
	
	if (irandom_range(1,49) <= ghostChance)
	{
		repeat(multiplier)
		{
			expGive();
			instance_create_layer(x,y,"Shots",oSpookyGhost)
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
