
var drawCorpse = function()
{
	draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale*size,
	image_yscale*size,
	rot,
	col,
	alpha);
}

drawCorpse();
//draw_text(x,y-60,corpse);
//draw_text(x,y,fresh);
//draw_text(x,y+20,digest);

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

if corpse = "killer7"
{
	gpu_set_blendmode(bm_add);
	shader_set(shRedFlash);
	drawCorpse();
	shader_reset();
	gpu_set_blendmode(bm_normal);
}

