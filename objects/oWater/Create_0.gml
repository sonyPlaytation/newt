/// @description

image_alpha = 0.5;
transBuffHeight = 32; //Transparency buffer height
springCount = ceil(sprite_width/(TILE_SIZE/3))
springs[springCount] = 0;
springsVel[springCount] = 0;
springDeltaL[springCount] = 0;
springDeltaR[springCount] = 0;
k = 0.035;
d = 0.025;
spread = 0.25;

meeting = false;

color = #7DA7D9;