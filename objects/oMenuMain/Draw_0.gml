/// @description

//update tag
var _sine = 0.1 + (1+sin(2*pi*current_time/1000 * 0.30)) * 0.1;

drawSetText(c_white,global.fIgnoreMod,fa_right,fa_middle);
draw_text_transformed(tagX,tagY,tag,1+_sine,1+_sine,0);

