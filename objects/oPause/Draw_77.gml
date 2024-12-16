/// @description Insert description here
// You can write your code in this editor


	//disable alpha blending
	gpu_set_blendenable(false);

	if (pause) //screenshot of game frame while paused
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

	if input_check_pressed("pause")
	{
		switch (pause)
		{
			case false:
				pauseGame();
			break;

			case true:
				unpauseGame();
			break;
		}
	}

	gpu_set_blendenable(true);