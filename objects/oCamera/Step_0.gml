
if screenPause() {exit;};

//update destination
if (instance_exists(follow))
{
	xTo = follow.x
	yTo = follow.y
	
	if ((follow).object_index == oDead)
	{
			x = xTo;
			y = yTo;
	}
}

//update object position UPDATE TO HAVE STATE DEPENDENT BUFFER SPEEDS

x += (xTo - x) / curBuff;
y += (yTo - y) / curBuff;

//keep camera in room
x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);

//screenshake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_mag));


//update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

