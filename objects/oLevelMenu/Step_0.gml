/// @description Insert description here
// You can write your code in this editor

/// @description control menu


//item ease in



state();



////key controls
//if (menu_control)
//{
//	if (keyboard_check_pressed(ord("A")))
//	{
//		menu_cursor++;
//		if (menu_cursor >= menu_items) menu_cursor = 0;

		
//	}
	
//	if (keyboard_check_pressed(ord("D")))
//	{
//		menu_cursor--;
//		if (menu_cursor < 0) menu_cursor = menu_items-1;

		
//	}
	
//	if (keyboard_check_pressed(vk_enter)) or (keyboard_check_pressed(vk_space)) or (keyboard_check_pressed(ord("E"))) or mouse_check_button_pressed(1)
//	{
//		menu_x_target = -gui_width;
//		menu_committed = menu_cursor;
//		screenShake(15,35);
//		menu_control = false;
//		audio_play_sound(snHL1Explosion,999,0);	
//	}
	
//	var mouse_y_gui = device_mouse_y_to_gui(0);
//	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
//	{
//		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		
//			if (mouse_check_button_pressed(mb_left))
//			{
//				menu_x_target = -gui_width;
//				menu_committed = menu_cursor;
//				screenShake(15,35);
//				menu_control = false;
//				audio_play_sound(snHL1Explosion,999,0);	
//			}
		
//	}
	
	
//}



//if (menu_x < -200) && (menu_committed != -1)
//{
//	switch (menu_committed)
//	{
//		case 2: slideTransition(TRANS_MODE.NEXT); break;
//		case 1: 
//		{
//			if (!file_exists(SAVEFILE))
//			{
//				slideTransition(TRANS_MODE.NEXT);
//			}
//			else
//			{
//				var file = file_text_open_read(SAVEFILE);
//				var target = file_text_read_real(file);
//				global.kills = file_text_read_real(file);
//				oGame.combomax = file_text_read_real(file);
//				file_text_close(file);
//				slideTransition(TRANS_MODE.GOTO,target);
//			}
//		}
//		break;
//		case 0: game_end(); break;
//	}
	
	
	
//}






