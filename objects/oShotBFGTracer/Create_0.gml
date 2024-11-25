

draw_alpha = 1;
check = true;

prev_x = x;
prev_y = y;
can_damage = true;
hitSprite = noone;
shotNumber = 0;
visDist = 0;
headshot = false;

dist = 0;

if global.soda[3] {col = c_fuchsia}else col = c_lime;

layer = layer_get_id("shots");
hitSprite = sHitPixel;
tracerDMG = 0;

