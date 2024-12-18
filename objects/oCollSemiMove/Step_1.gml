
//screen pause
if screenPause() {exit;};

//move in a circle
dir += rotSp;

var _targetX = xstart+lengthdir_x(radius,dir);
var _targetY = ystart+lengthdir_y(radius,dir);

//get hsp and vsp
hsp = _targetX - x;
if !moveX {hsp = 0};
vsp = _targetY - y;
if !moveY {vsp = 0};

//move
x+= hsp;
y+= vsp;