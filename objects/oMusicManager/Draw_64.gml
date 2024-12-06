/// @description

//alpha = lerp(alpha,0,playingFade/100);
if playingFade > 0
{

	if alpha < 1 and !fadeDone
	{
		fadeTarg++;
		alpha = fadeTarg/playingFade;
	}
	else if alpha == 1
	{
		fadeDone = true;
		holdTime--;
	};
	
	if holdTime < 0 {alpha *= 0.95}; 
	
	draw_set_alpha(alpha);

	drawSetText(c_white,global.fIgnoreMod,fa_center,fa_bottom);
	draw_text_transformed(msgX,msgY,playingMsg,2,2,0);

	draw_set_alpha(1);
}
else fadeDone = false;