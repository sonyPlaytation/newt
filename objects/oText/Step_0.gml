/// @description progress text

letters += spd;
text_current = string_copy(text,1,floor(letters));


draw_set_font(fSign);
if (h == 0) h = string_height(text);
w = string_width(text_current);

if input_check_pressed("accept") or input_check_pressed("jump")
{instance_destroy();}

//destroy when done
if !done && (!point_in_circle(oNewt.x,oNewt.y,x,y+22,200))
{
	done = true
	alarm[0] = 30;
}
