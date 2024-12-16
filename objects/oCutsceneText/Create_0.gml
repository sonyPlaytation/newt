/// @description

text = "DEFAULT Second Line";
name = ""
nameCol = c_aqua;
nameShadowCol = c_purple;
follow = oExitDoor;

alpha = 1;
border = 45;
bordInner = floor(border/2);
corner = 45;
length = string_length(text);
h = 350;
w = RESOLUTION_W;
textX = RESOLUTION_W/2;
textY = RESOLUTION_H;
boxCol = #221428;
spd = 0.05;
charCnt = 0;

arr[0] = t6;
arr[1] = t2;
arr[2] = t3;
arr[3] = t4;

global.gameState = 1;

//Body Text
font = fTextBox;
fontString = font_get_fontname(font);
fontBaked = string_concat(fontString,"Baked");

scribble_font_bake_shadow("fTextBox",fontBaked,2,2,c_black,1,0,false);
scribble_font_scale(fontBaked,2);

typMain = scribble_typist();

typMain	
	.ease(SCRIBBLE_EASE.QUAD,0,15,1,1,0,1)
	.in(0.5,3)
//	.sound_per_char(arr,1,1)
;

//Name Text
scribble_font_bake_shadow("fCanont","fName",5,0,nameShadowCol,1,0,false);
