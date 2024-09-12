/// @description Insert description here
// You can write your code in this editor

//disable alpha blending
gpu_set_blendenable(false);

if (pause)
{
		surface_set_target(application_surface);
			if (surface_exists(pauseSurf)) draw_surface(pauseSurf,0,0);
			else
			{
				pauseSurf = surface_create(RESOLUTION_W,RESOLUTION_H);
				buffer_set_surface(pauseSurfBuffer,pauseSurf,0);
			}
	surface_reset_target();
}

if (keyboard_check_pressed(vk_tab)) or gamepad_button_check_pressed(4,gp_start)
{
	if (!pause)
	{
		pause = true;
		instance_deactivate_all(true);
		
		
		pauseSurf = surface_create(RESOLUTION_W,RESOLUTION_H);
		surface_set_target(pauseSurf);
			draw_surface(application_surface,0,0);
		surface_reset_target();
	
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		pauseSurfBuffer = buffer_create(RESOLUTION_W * RESOLUTION_H * 4, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	else
	{
		pause = false;
		instance_activate_all();
		if (surface_exists(pauseSurf)) surface_free(pauseSurf);
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
	}
}

gpu_set_blendenable(true);