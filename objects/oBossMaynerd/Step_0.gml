/// @description

//screen pause
if screenPause() {exit;};


if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
}

if !inactive
{
	vsp = vsp + grv;
	
	if oRoomMiddle.x < x {facing = -1} else {facing = 1};
	
	////horizontal collision
	//if (place_meeting(x+hsp,bbox_top,oCollide))
	//{
	//	while (!place_meeting(x+sign(hsp),y,oCollide))
	//	{
	//		x = x + sign(hsp)
	//	}
	//	hsp = 0;
	//}
	//x += hsp

	////vertical collision
	//if (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oCollSemi))
	//{
	//	while (!place_meeting(x,y+sign(vsp),oCollide)) and (place_meeting(x,y+vsp,oCollSemi))
	//	{
	//		y += sign(vsp)
	//	}
	//	vsp = 0;
	//}
	//y += vsp;
	
	////Animation
	//if (!place_meeting(x,y+1,oCollide))
	//{
	//	grounded = false;
	//	sprite_index = sMaynerdAir;
	//	image_speed = 0;
	//	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	//}
	//else
	//{
	//	grounded = true;
	//	image_speed = 1;
	//	if (hsp == 0) or (inactive == true)
	//	{
	//		sprite_index = sMaynerd;
	//	}
	//	else
	//	{
	//		sprite_index = sMaynerdWalk;
	//	}
	//}
	//if (hsp != 0) image_xscale = sign(hsp) * size;
	//image_yscale = size;
	
	state();
}