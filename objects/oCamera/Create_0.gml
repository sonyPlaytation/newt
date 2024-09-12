
cam = view_camera[0];
follow = oNewt;

view_w_half = camera_get_view_width(cam)	/ 2;
view_h_half = camera_get_view_height(cam)	/ 2;

xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_mag = 0;
shake_remain = 0;
buff[0] = 11;
buff[1] = 1;
curBuff = buff[0];