/// @description Insert description here
// You can write your code in this editor
var i = 0;

broken = true;

oSFX.brickbreak = true;

repeat(2)
		{
			instance_create_layer(x + i + 4,bbox_bottom, "Player", oBricks)
			i += 12;
		}

if regen == true {instance_create_layer(x,y,"Player",oSpotRememberer)};

instance_destroy()

