
draw_self();


if (flash > 0)
{
	flash--;
	shader_set(shWhiteFlash);
	draw_self();
	shader_reset();
}