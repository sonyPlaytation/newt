


gpu_set_blendmode(bm_add);

draw_sprite_ext(sprite_index,image_index,x,y,3,3,dir,color,0.5)
draw_trail(length,width,color,sprite,slim,alpha);
if oInv.hpMissing !=0 {draw_trail(8,width,color,-1,slim,1)};
if crit {draw_trail(12,width+3,c_white,-1,slim,1)};

gpu_set_blendmode(bm_normal);
draw_self();

