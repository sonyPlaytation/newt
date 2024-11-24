

/// @description move to next room

if (instance_exists(oNewt))
{
	if instance_exists(oLevelMenu) {oNewt.hasControl = false; oNewt.inspect = true;};
	
	if!instance_exists(oLevelMenu) and (point_in_circle(oNewt.x,oNewt.y,x,y,48)) and (oInv.sodas > 0) and image_index = 0
	{
		oExclam.image_index = 2;
		oNewt.exclam = true;
	
		if input_check_pressed("up")
		{
			layer_create(-9999,"LevelUp");
			instance_create_layer(0,0,"LevelUp",oLevelMenu);
		}
	}

	if !(point_in_circle(oNewt.x,oNewt.y,x,y,48))
	{
		broke = false;	
	}
}