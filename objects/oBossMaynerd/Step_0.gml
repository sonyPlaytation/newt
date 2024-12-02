/// @description

//screen pause
if screenPause() {exit;};


if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
}

state();