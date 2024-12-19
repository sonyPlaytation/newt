/// @description


if instance_exists(oNewt) and lowAmmo
{
	with oNewt
	{
		var scale = 2;
		
		drawSetText(c_black,fSign,fa_center,fa_bottom)
	
		draw_text_transformed(oNewt.x-2,oNewt.y-45,oAmmoCount.ammoString,scale,scale,0);
		draw_text_transformed(oNewt.x+2,oNewt.y-45,oAmmoCount.ammoString,scale,scale,0);
		draw_text_transformed(oNewt.x,oNewt.y-47,oAmmoCount.ammoString,scale,scale,0);
		draw_text_transformed(oNewt.x,oNewt.y-43,oAmmoCount.ammoString,scale,scale,0);
	
		draw_set_color(#eb445a);
		draw_text_transformed(oNewt.x,oNewt.y-45,oAmmoCount.ammoString,scale,scale,0);	
	}
}
