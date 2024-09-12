/// @description Insert description here
// You can write your code in this editor

depth = oLevelNewt.depth-100;

if (mouse_x > bbox_left) and (mouse_x < bbox_right)
{
	y = lerp(y,ystart-50,0.05);	
	alpha = min(alpha+0.1,1)
}
else
y = lerp(y,ystart,0.05);	
alpha = max(alpha-0.08,0)

if position_meeting(mouse_x,mouse_y,self) and (input_check_pressed("shoot") or input_check_pressed("accept"))
{
	oLevelMenu.sodaPicked = soda;
	sodaGet(soda);
	oInv.sodas--;
	oSFX.healsound = true;
	instance_destroy();
}
