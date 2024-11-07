

if active {alpha = min(alpha+0.1,0.80)}else {alpha = max(alpha-0.08,0)};
if alpha == 0 {instance_destroy()};

var halfw = w * 0.5;

//draw the box
draw_set_colour(#221428);
draw_set_alpha(alpha);
draw_roundrect_ext(
x-halfw-(border),
y-h-(border*2)-string_height_scribble(text_head),
x+halfw+(border),
y,
corner,
corner,
false);

if owner != oNewt
{
	draw_sprite(sTextBottom,0,x,y)
	draw_set_alpha(1);
	draw_sprite_ext(sExclam,3,x+halfw,y+(border/1.5),1,1,0,c_white,alpha*1.5);
}
else 
{
	draw_set_alpha(1);
}
//draw text
var scribbleObject = scribble(text_body)

	.blend(c_white,alpha*1.5)
	.starting_format("fKaren",c_white)
	.align(fa_center,fa_top)
	
var scribbleHeader = scribble(text_head)
	.blend(c_white,alpha*1.5)
	.starting_format("fKaren",c_white)
	.align(fa_center,fa_top)
	.reveal(letters)
	
scribbleHeader.draw(x,y-h-border-string_height_scribble(text_head),typist);
scribbleObject.draw(x,y-h-border);
