/// @description gui/vars/menu setup

#macro SAVEFILE "Save.sav"

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

menu[2] = "New Game";
menu[1] = "Continue";
menu[3] = "Tutorial";
menu[4] = "What's New?";
menu[5] = "Boss Fight";
menu[0] = "Quit";

menu_items = array_length(menu);

menu_top = menu_y - ((menu_itemheight*1.5) *menu_items);

menu_cursor = 2;

