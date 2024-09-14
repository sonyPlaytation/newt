sineWave = 0.1 + (1+sin(2*pi*current_time/1000 * 0.30)) * 0.2;

draw_sprite_ext(
sprite_index,
image_index,
x,
y+sineWave,
1,
1,
image_angle,
c_white,
1);

//if myRoom!= noone
//{
//	draw_text(x,y-sprite_height,myRoom);
	
//}

if (flash > 0)
{
	flash--;
	if (diedFrom == "killer7")shader_set(shRedFlash) else shader_set(shWhiteFlash);
	draw_self();
	shader_reset();
}
