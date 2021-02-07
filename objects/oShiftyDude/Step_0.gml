

drawTimer += 1;
var _diffX = destinationX - x;
var _diffY = destinationY - y;
var _tot = point_distance(x, y, destinationX, destinationY);

var _newX = x + _diffX / _tot * spd;
var _newY = y + _diffY / _tot * spd;

var _insideLight = false;

// Never move into the light
for (var i=0; i< array_length(global.ILightables); i++) {
	var _lightable/*:ILight*/ = global.ILightables[i];
	
	with (_lightable) {
		if (point_distance(_newX, _newY, x, y) < displayLightRange*260) {
			_insideLight = true;
			break;
		}
	}
}

if (_insideLight) {
	selectDestination();
}

var _spd = 1;

// If thunder, flee from the screen
if (oDarkness.lightningStrength > 0 || oDarkness.lightningTimer < 1) {
	var _dir = point_direction(x, y, oPlayer.x, oPlayer.y);
	var _len = random_range(200, 1000);
	_dir += 180 + random_range(-10, 10);
	destinationX = x + lengthdir_x(_len, _dir);
	destinationY = y + lengthdir_y(_len, _dir);
	_spd = 3;
}


xSpd += 0.5*_diffX/_tot;
ySpd += 0.5*_diffY/_tot;

xSpd *= 0.96;
ySpd *= 0.96;

x+=xSpd * _spd;
y+=ySpd * _spd;

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