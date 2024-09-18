/// @description Insert description here
// You can write your code in this editor


if instance_exists(oNewt)
{
	x = oNewt.x;
	y = (oNewt.y+sin(get_timer()/300000) *4) - 54;
	
	oExclam.image_alpha = alpha;

	if !instance_exists(oText) && (oNewt.exclam = true)
	{
		alpha = 1;
	}
	else alpha = 0;
}




