/// @description gui/vars/menu setup

// SaraJS Main Menu

room_pack_blank_object = oBlank;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = (gui_width/2)+gui_width;
menu_y = gui_height - (gui_margin*5);
menu_x_target = gui_width/2;
menu_speed = 25;
menu_font = fIgnoreStd;
scale = 3;
menu_itemheight = font_get_size(fCanont);
menu_committed = -1;
menu_control = true;

menu[3] = "Resume";
menu[2] = "Options";
menu[1] = "Main Menu";
menu[0] = "Quit";

menu_items = array_length(menu);
menu_top = menu_y - ((menu_itemheight*1.5) *menu_items);
menu_cursor = 2;


//menu num 
ver = "v0.03";

verX = 10;
verY = RESOLUTION_H-verX;

menuBGM = mPauseMenu
audio_play_sound(menuBGM,900,true,global.musicVolume*global.masterVolume);