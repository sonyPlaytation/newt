/// @description Insert description here
// You can write your code in this editor

event_inherited();

if !instance_exists(oPhysMelon){melonTimer--};
if melonTimer = 0
{
	instance_create_layer(phy_position_x,phy_position_y-50,layer,oPhysMelon);
	melonTimer = 300;
}

sprite_index = sDummyBody;


