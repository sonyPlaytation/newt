/// @description draw menu

//main menu
draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
	
	var offset = 5;
	var txt = menu[i];
	if (menu_cursor == i)
	{
		//txt = string_insert("> ", txt, 0);
		var col = c_white;
	}
	else
	{
		var col = c_gray;	
	}
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * ( i * 1.5));
	
	draw_set_color(c_black);
	draw_text_transformed(xx,yy+offset,txt,scale,scale,0);
	draw_set_color(col);
	draw_text_transformed(xx,yy,txt,scale,scale,0);
	
}

//version number
drawSetText(c_grey,fSmart,fa_left,fa_bottom);
draw_text_transformed(verX,verY,ver,2,2,0);
