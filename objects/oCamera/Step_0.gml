
if screenPause() {exit;};

switch(global.gameState)
{
	case 0: //normal gameplay

		camera_set_view_target(cam,noone)	
		camera_set_view_size(cam,currResW,currResH);
		
		view_w_half = camera_get_view_width(cam)	/ 2;
		view_h_half = camera_get_view_height(cam)	/ 2;
	
		//update destination
		if (instance_exists(follow))
		{
			xTo = follow.x;
			yTo = follow.y;
	
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
		
	break;
	
	case 1: //cutscene
	
		if !instance_exists(cutFollow){cutFollow = oNewt};
		camera_set_view_target(cam,cutFollow);
		camera_set_view_size(cam,currResW,currResH);
	
		view_w_half = camera_get_view_width(cam)	/ 2;
		view_h_half = camera_get_view_height(cam)	/ 2;
	
		//update destination
		if (instance_exists(cutFollow))
		{
			xTo = cutFollow.x;
			yTo = cutFollow.y;
	
			if ((cutFollow).object_index == oDead)
			{
				x = xTo;
				y = yTo;
			}
		}

		//update object position UPDATE TO HAVE STATE DEPENDENT BUFFER SPEEDS

		x += (xTo - x) / curBuff;
		y += (yTo - y) / curBuff;

		//keep camera in room
		//x = clamp(x,view_w_half,room_width-view_w_half);
		//y = clamp(y,view_h_half,room_height-view_h_half);

		//screenshake
		x += random_range(-shake_remain,shake_remain);
		y += random_range(-shake_remain,shake_remain);
		shake_remain = max(0,shake_remain-((1/shake_length)*shake_mag));

		//update camera view
		camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
		
	break;
}

currZoom = lerp(currZoom, zoom[global.gameState],zoomLerp)

currResW = lerp(currResW,RESOLUTION_W/currZoom,0.1);
currResH = lerp(currResH,RESOLUTION_H/currZoom,0.1);