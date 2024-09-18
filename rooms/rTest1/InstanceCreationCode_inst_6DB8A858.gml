
if instance_exists(oInv)
{
	if oInv.levelCurrent <= 1 {instance_destroy();}
	else
	{
		draw_sprite(Sprite182,2,x-50,y-75);
	}
}