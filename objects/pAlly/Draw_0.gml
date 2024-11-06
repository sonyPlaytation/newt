
draw_self();

if (flash > 0)
{
	flash--;
	if (diedFrom == "killer7")shader_set(shRedFlash) else shader_set(shWhiteFlash);
	draw_self();
	shader_reset();
}
