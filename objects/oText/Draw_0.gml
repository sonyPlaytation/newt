/// @description Insert description here
// You can write your code in this editor
depth = -9999

var halfw = w * 0.5;

//draw the box

draw_set_colour(#221428);
draw_set_alpha(0.70);
draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border,y,corner,corner,false);

draw_sprite(sTextBottom,0,x,y);
draw_set_alpha(1);

//draw text

drawSetText(c_white,fSign,fa_center,fa_top);
draw_text(x,y-h-border,text_current);