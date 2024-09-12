

draw_trail(length,width,color,sprite,slim,alpha);
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index,image_index,x,y,3,3,dir,color,0.5)
gpu_set_blendmode(bm_normal);
draw_self();


