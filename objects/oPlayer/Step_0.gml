
if (dead) {
	hasTorch = false;
	displayLightStrength = 0;
	displayLightRange = 0;
	exit;
}

if (hasTorch) {
	torchTimer += 15/60;
	torchFuel -= 1/60;
	displayLightRange = clamp(torchFuel/20 + 0.1, 0, 2) + random_range(0, 0.1);
	displayLightStrength = clamp(torchFuel/40, 0, 1);
	
	if (torchFuel <= 0) {
		hasTorch = false;
	}
} else {
	displayLightRange = 0;
	displayLightStrength = 0;
}

var _closestFire = instance_nearest(x, y, oFire);

heat -= 1/60;
if (instance_exists(_closestFire)) {
	heat += clamp(_closestFire.displayLightStrength*(3 - point_distance(x, y, _closestFire.x, _closestFire.y)/120), 0, 1 )/10;
}
show_debug_message(heat);
heat = clamp(heat, 0, 60);

if (heat <= 0) {
	dead = true;
}

var _vSpd = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var _hSpd = keyboard_check(ord("D")) - keyboard_check(ord("A"));

var _d = spd * (0.5 + heat/120);
var _nx = x + _hSpd * _d;
var _ny = y + _vSpd * _d;

if (place_meeting(_nx, _ny, oSolid)) {
	while (_d >= 0.5) {
		_d/=2;
		_nx = x + _hSpd * _d;
		_ny = y + _vSpd * _d;
		if (place_meeting(x, _ny, oSolid) == false) {
			y = _ny;
		}
		if (place_meeting(_nx, y, oSolid) == false) {
			x = _nx;
		}
	}
} else {
	x = _nx;
	y = _ny;
}


canLightNewTorch = hasTorch && torchFuel < 30 && sticks > 0;

if (canLightNewTorch && keyboard_check_pressed_once("Q")) {
	sticks--;
	torchFuel = 60;
}

canStartNewFire = hasTorch && sticks >= 3;

var _nearestFire = instance_nearest(x, y, oFire);
if (_nearestFire != noone && _nearestFire.playerCanDeposit) {
	canStartNewFire = false;
}

var _nearestStick = instance_nearest(x, y, oStick);
if (_nearestStick != noone && _nearestStick.canPickUp) {
	canStartNewFire = false;	
}

if (canStartNewFire && keyboard_check_pressed_once("E")) {
	instance_create_depth(x, y, 0, oFire);
	sticks-=3;
}

if (keyboard_check(vk_control) && keyboard_check(ord("F")) && keyboard_check_pressed(ord("U"))) {
	sticks++;
}

depth = -y;