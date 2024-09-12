/// @description Insert description here
// You can write your code in this editor


if (alpha > 0)
{
	
	if instance_exists(owner)
	{
		
		dmgTextScale= max(dmgTextScale * 0.95, 0.5);

		drawSetText(c_black,fCanontDMG,fa_center,fa_bottom);
		draw_text_transformed(owner.x,owner.bbox_top ,string(damage),dmgTextScale,dmgTextScale,0);

		draw_set_color(c_white);
		draw_text_transformed(owner.x,owner.bbox_top -2 ,string(damage),dmgTextScale,dmgTextScale,0);
		
	}
	else
	{
		
		dmgTextScale= max(dmgTextScale * 0.95, 0.5);

		drawSetText(c_black,fCanontDMG,fa_center,fa_bottom);
		draw_text_transformed(x,y,string(damage),dmgTextScale,dmgTextScale,0);

		draw_set_color(#eb445a);
		draw_text_transformed(x,y-2,string(damage),dmgTextScale,dmgTextScale,0);	
		
	}
}else damage = 0;