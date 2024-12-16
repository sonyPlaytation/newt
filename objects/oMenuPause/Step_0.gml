/// @description control menu

if room != rMenu and input_check_pressed("pause")
{
	instance_destroy();	
}

//item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//key controls
if (menu_control)
{
	if input_check_pressed("up")
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if input_check_pressed("down")
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}
	
	if input_check_pressed("accept") or input_check_pressed("shoot")
	{
		menu_x_target = -gui_width;
		menu_committed = menu_cursor;
		menu_control = false;
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		
		if input_check_pressed("shoot") or input_check_pressed("jump")
		{
			menu_x_target = -gui_width;
			menu_committed = menu_cursor;
			menu_control = false;
		}
	}
}

if (menu_committed != -1) and menu_x < -200
{
	switch (menu_committed)
	{
		case 4: unpauseGame() if instance_exists(oNewt){oNewt.propBuffer = 10}; break;
		
		case 3: systemMsg("still working on it",,true); break;

		case 2: systemMsg("there are no options",,true); break; //OPTIONS
		
		case 1: unpauseGame() slideTransition(TRANS_MODE.RESTART); break;	//MAIN MENU
		
		case 0: game_end(); break;		 //QUIT
	}
	instance_destroy();
}



