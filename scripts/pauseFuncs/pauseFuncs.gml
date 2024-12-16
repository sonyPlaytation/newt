// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pauseGame(){

	if room != rMenu
	{
		with (oPause)
		{
			sine = 0;
			pause = true;
			instance_deactivate_all(true);
			instance_activate_object(pPhysProp);
			instance_activate_object(oTransition);
			instance_activate_object(oGame);
			instance_activate_object(input_controller_object);
			instance_activate_object(oMusicManager);
		
			bgLayer = layer_background_get_id("Background")	// get ID of BG
		
			bgHSPD = layer_get_hspeed(bgLayer)				// get Horizontal Speed of BG
			bgVSPD = layer_get_vspeed(bgLayer)				// get Vertical Speed of BG
		
			layer_hspeed(bgLayer, 0);						// set Horizontal Speed of BG Layer to zero
			layer_vspeed(bgLayer, 0);						// set Vertical Speed of BG Layer to zero
		
			audio_pause_all();
		
			pauseSurf = surface_create(RESOLUTION_W,RESOLUTION_H);
			surface_set_target(pauseSurf);
				draw_surface(application_surface,0,0);
			surface_reset_target();
	
			if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
			pauseSurfBuffer = buffer_create(RESOLUTION_W * RESOLUTION_H * 4, buffer_fixed, 1);
			buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
		}
	}
}

function unpauseGame()
{
	if room != rMenu
	{
		with (oPause)
		{
			pause = false;
			instance_activate_all();
		
			layer_hspeed(bgLayer, bgHSPD);					// set Horizontal Speed of BG Layer to zero
			layer_vspeed(bgLayer, bgVSPD);					// set Vertical Speed of BG Layer to zero
		
			audio_resume_all();
		
			if (surface_exists(pauseSurf)) surface_free(pauseSurf);
			if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);	
		}
	}
}