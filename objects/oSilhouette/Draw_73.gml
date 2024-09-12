/// @description Insert description here
// You can write your code in this editor


gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);

//draw silhouette
draw_sprite_tiled(sBrickWall,0,x,y);
//with(oMultiWeapon) draw_self();
//with(oNewt) draw_self();
gpu_set_fog(false, c_white, 0, 0);

gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);

