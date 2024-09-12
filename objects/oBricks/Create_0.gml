/// @description Insert description here
// You can write your code in this editor

done = 0;
hsp = 0;
vsp = 0;
grv = 0.3;

image_angle = irandom(359);

//alarm[0] = 120

if (instance_exists(oNewt)) depth = oNewt.depth-50;

repeat(4)
		{
			instance_create_layer(x,bbox_bottom, "Player", oDust)
			
		}