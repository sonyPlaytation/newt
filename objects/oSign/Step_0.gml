	/// @description Insert description here
	// You can write your code in this editor

if instance_exists(oNewt) and (point_in_circle(oNewt.x,oNewt.y,x,y,64)) and !instance_exists(oText)
{
	oExclam.image_index = 2;
	oNewt.exclam = true;
	
	nearby = true;
	if input_check_pressed("up")
	{
		with(instance_create_layer(x,y-22,"Interact",oCutsceneText))
		{
			text = other.text;
			length = string_length(text);
		}
	}
}	else nearby = false;

