
//screen pause
if screenPause() {exit;};

//move in a circle
dir += rotSp;

var _targetX = xstart+lengthdir_x(radius,dir);
var _targetY = ystart+lengthdir_y(radius,dir);

//get xspd and yspd
xspd = _targetX - x;
if !moveX {xspd = 0};
yspd = _targetY - y;
if !moveY {yspd = 0};

//move
x+= xspd;
y+= yspd;