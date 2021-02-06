

drawTimer += 1;
var _diffX = destinationX - x;
var _diffY = destinationY - y;
var _tot = point_distance(x, y, destinationX, destinationY);

var _newX = x + _diffX / _tot * spd;
var _newY = y + _diffY / _tot * spd;

var _selected = false;

// Never move into the light
for (var i=0; i< array_length(global.ILightables); i++) {
	var _lightable/*:ILight*/ = global.ILightables[i];
	
	with (_lightable) {
		if (point_distance(_newX, _newY, x, y) < displayLightRange*260) {
			_selected = true;
			break;
		}
	}
}

if (_selected) {
	selectDestination();
}

xSpd += 0.5*_diffX/_tot;
ySpd += 0.5*_diffY/_tot;

xSpd *= 0.96;
ySpd *= 0.96;

x+=xSpd;
y+=ySpd;

var _dist = point_distance(x,y,oPlayer.x,oPlayer.y);
if (_dist < 80 || (_dist < 120 && oPlayer.hasTorch == false)) {
	if (oPlayer.eaten == false && oPlayer.torchFuel < 30) {
		instance_create_depth(oPlayer.x, oPlayer.y, 0, oBlood);
		with (oPlayer) {
			eaten = true;
			dead = true;
		}
	}
}

if (point_distance(x, y, destinationX, destinationY) < 30) {
	selectDestination();
}

if (xSpd != 0) {
	facingSide = sign(xSpd);
}