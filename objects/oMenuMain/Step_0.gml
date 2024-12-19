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
		
		if input_check_pressed("accept") or input_check_pressed("shoot")
		{
			menu_x_target = -gui_width;
			menu_committed = menu_cursor;
			menu_control = false;	
		}
	}
}

if (menu_x < -200) && (menu_committed != -1)
{
	oPause.pause = false;
	switch (menu_committed)
	{
		case 5: slideTransition(TRANS_MODE.INIT, rVoid); break; //BOSS FIGHT
		case 4: global.lvlFloor = 0;	slideTransition(TRANS_MODE.INIT, rTutorialNew7); break; //WHATS NEW
		case 3: global.lvlFloor = 444;	slideTransition(TRANS_MODE.INIT, rTutorialNew1); break; //TUTORIAL
		case 2: slideTransition(TRANS_MODE.INIT, rTest3); break; //NEW GAME
		
		case 1: //CONTINUE
		if (!file_exists(SAVEFILE))
		{
			slideTransition(TRANS_MODE.NEXT);
		}
		else
		{
			var file = file_text_open_read(SAVEFILE);
			var target = file_text_read_real(file);
			global.kills = file_text_read_real(file);
			oGame.combomax = file_text_read_real(file);
			file_text_close(file);
			slideTransition(TRANS_MODE.INIT,target);
		}
		break;
		
		case 0: game_end(); break; //QUIT
	}
}




