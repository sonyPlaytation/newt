/// @description draw kills

if killscombo > combomax {combomax = killscombo};

drawSetText(c_black,fCanont,fa_right,fa_top);

if (room != rMenu) and (instance_exists(oNewt)) and (killscombo > 0)
{
	killtextscale = max(killtextscale * 0.95, 1);
	
	//combo count
	draw_text_transformed(RESOLUTION_W-25, 25,string(killscombo) + " Combo",killtextscale,killtextscale,0);
	
	if firstCombo {draw_set_colour(c_yellow)} else {draw_set_colour(c_white)} ;
	draw_text_transformed(RESOLUTION_W-23, 23,string(killscombo) + " Combo",killtextscale,killtextscale,0);
	
	//combo timer
	drawSetText(c_black,fSign,fa_right,fa_top);
	draw_text_transformed(RESOLUTION_W-45, 45,string(combotimer),killtextscale,killtextscale,0);
	
	if firstCombo {draw_set_colour(c_red)} else {draw_set_colour(c_white)} ;
	draw_text_transformed(RESOLUTION_W-63, 63,string(combotimer),killtextscale * 3,killtextscale * 3,0);
	
}


if instance_exists(oNewt) and (oNewt.hasControl == true) and !instance_exists(oSoda)
{
combotimer--;

}

if (combotimer <= 0)
{
	killscombo = 0;
	
	if global.kills >=1 {firstCombo = false};
}