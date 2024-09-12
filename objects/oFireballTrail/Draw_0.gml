
gpu_set_blendmode(bm_add);
//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*2,image_yscale*2,image_angle,c_white,0.1);

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*random(2),image_yscale*random(1.3),image_angle,c_white,1);

gpu_set_blendmode(bm_normal);