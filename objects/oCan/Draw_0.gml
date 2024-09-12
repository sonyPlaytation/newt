/// @description Insert description here
// You can write your code in this editor

draw_self();



//draw text
drawSetText(c_black,fMecha,fa_center,fa_middle);
draw_text_transformed_color(xstart+sprite_width/2,ystart+sprite_height,desc[soda],2,2,0,0,0,0,0,alpha);

draw_set_color(c_white);
draw_text_transformed_color(xstart+sprite_width/2-2,ystart+sprite_height-2,desc[soda],2,2,0,c_white,c_white,c_white,c_white,alpha*1.5);
	
