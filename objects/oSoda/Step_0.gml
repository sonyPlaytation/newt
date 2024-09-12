

/// @description move to next room

if instance_exists(oLevelMenu) {oNewt.hasControl = false;};

if (instance_exists(oNewt)) and !instance_exists(oLevelMenu) and instance_nearest(x,y,oNewt) and (point_in_circle(oNewt.x,oNewt.y,x,y,48)) and (oInv.sodas > 0) and image_index = 0
{
	oExclam.image_index = 2;
	oNewt.exclam = true;
	
	if input_check_pressed("up")
	{
		layer_create(-9999,"LevelUp");
		instance_create_layer(0,0,"LevelUp",oLevelMenu);
	}
}