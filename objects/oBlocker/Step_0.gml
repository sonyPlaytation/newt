/// @description Insert description here
// You can write your code in this editor

if instance_exists(oRoomDetect)
{

	myWall.y = y;

	if (y > origin+10)
	{
		doorClosed = true;
	}

	//if room is active but not cleared
	if (myRoom.roomActive == true) and (myRoom.roomCleared == false)
	{

	
		//if the pushbox doesnt exist, make one
		if !instance_exists(oBlockMove) {instance_create_layer(x,y,layer,oBlockMove)};
	
		//newt collide with pushbox
		if (place_meeting(x,y,oNewt))
		{
			var _dir = point_direction(oNewt.x,oNewt.y,x,y);
			oNewt.x -= lengthdir_x(12,_dir);
		}
	
		//if door isnt closed, move it down
		if (y < origin + destination)
		{
		y+= acc;
		acc++;
		}
	
	
	}

	if y >= origin + destination
	{
		with (oBlockMove) instance_destroy();
	}

	if (myRoom.roomCleared == true)
	{
		doorClosed = false;
		if (y != origin)
		y -= 2;
	}

	if (myRoom.roomCleared == true) and (y = origin) and (!done)
	{
	
	}
}