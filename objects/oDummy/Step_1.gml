/// @description Insert description here
// You can write your code in this editor

event_inherited();

if !instance_exists(oMelon){melonTimer--};
if melonTimer = 0
{
	instance_create_layer(phy_position_x,phy_position_y-50,layer,oMelon);
	melonTimer = 300;
}

sprite_index = sDummyBody;


