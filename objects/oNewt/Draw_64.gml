

draw_set_font(fSign);
draw_set_color(c_white);



//var dist = point_distance(oNewt.x,oNewt.y-22,pShootable.x,pShootable.y)

//drawSetText(c_white,fSign,fa_center,fa_middle)
//draw_text_transformed(500,130,global.critTotalDMG,5,5,0);
//draw_text_transformed(500,180,oGame.critChance,5,5,0);
//draw_text_transformed(160,160,oGame.critTimer,5,5,0);

draw_text(400,50,global.inputdevice);
draw_text(450,50,string(oMultiWeapon.image_index));
draw_text(500,50,string(oMultiWeapon.image_speed));
//draw_text(400,65,string(oNewt.image_index));

