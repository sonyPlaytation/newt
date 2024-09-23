

var drawCorpse = function()
{
	draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	size,
	size,
	rot,
	col,
	alpha);
}

drawCorpse();

if (flash > 0)
{
	flash--;
	shader_set(shWhiteFlash);
	drawCorpse();
	shader_reset();
}

if charred
{
	shader_set(shBlack);
	drawCorpse();
	shader_reset();
}