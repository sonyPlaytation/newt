/// @description draw menu


alpha = min(0.65,alpha+0.10);
draw_set_color(#221428);
draw_set_alpha(alpha);
draw_rectangle(0,0,RESOLUTION_W,RESOLUTION_H,0)
draw_set_alpha(1);
	
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

drawSetText(c_red,global.fIgnoreMod,fa_center,fa_middle);
var _wave = wave(-7,7,6);
draw_set_alpha(alpha*1.5);
draw_text_transformed(RESOLUTION_W/2, RESOLUTION_H/3, "YOU DIED!",5,5,_wave);
draw_set_alpha(1);