
x = oPlayer.x;
y = oPlayer.y;

var _w2 = width/2;
var _h2 = height/2;

x0 = x-_w2;
y0 = y-_h2;
x1 = x+_w2;
y1 = y+_h2;

camera_set_view_pos(cam, x0, y0);