
cam = view_camera[0];
follow = oNewt;
cutFollow = oNewt;

currResW = RESOLUTION_W/2;
currResH = RESOLUTION_H/2;

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

zoom[0] = 2
zoom[1] = 3;
currZoom = zoom[0];
zoomLerp = 0.5;



