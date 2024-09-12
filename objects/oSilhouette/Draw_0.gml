/// @description Insert description here
// You can write your code in this editor

gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);

var cam = view_camera[0];
var cx = camera_get_view_x(cam);
var cy = camera_get_view_y(cam);
var w = camera_get_view_width(cam);
var h = camera_get_view_height(cam);

draw_set_alpha(0);
var x1 = x-sprite_xoffset;
var y1 = y-sprite_yoffset;

draw_rectangle(cx, cy, cx+w, cy+h, false);

draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendenable(true);


