/// @description

var halfw = w/2;

draw_set_colour(boxCol);
draw_set_alpha(alpha);
draw_roundrect_ext(
textX-halfw+border,
textY-h-border,
textX+halfw-border,
textY-border,
corner,
corner,
false);

var scrNamePlate = scribble(name)
	.starting_format("fName",nameCol)
	.align(fa_left, fa_middle)
	;

var scrObject = scribble(text)
	.starting_format(fontBaked,c_white)
	.align(fa_left,fa_top)
	;

scrObject.draw(border*2,textY-h,typMain);

scrNamePlate.draw(border*2,textY-h-border);

if scrObject.on_last_page() 
and (input_check_pressed("interact") or input_check_pressed("shoot") or input_check_pressed("jump"))
{
	instance_destroy();	
}