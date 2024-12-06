/// @description

//screen pause
if screenPause() {exit;};


if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
}

if !inactive and hp > 0
{
	vsp = vsp + grv;
	
	if oRoomMiddle.x < x {facing = -1} else {facing = 1};
	
	state();
}