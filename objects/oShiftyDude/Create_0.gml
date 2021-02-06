spd = 15; ///@is {number}

xSpd = 0; ///@is {number}
ySpd = 0; ///@is {number}

destinationX = 0; ///@is {number}
destinationY = 0; ///@is {number}
drawTimer = 0; ///@is {number}

facingSide = 1; ///@is {int}

function selectDestination() {
	var _insideLight/*:ILight*/ = noone;
	for (var i=0; i< array_length(global.ILightables); i++) {
		var _lightable/*:ILight*/ = global.ILightables[i];
		with (_lightable) {
			if (point_distance(x, y, other.x, other.y) < displayLightRange*280) {
				_insideLight = _lightable;
				break;
			}
		}
	}
	if (instance_exists(_insideLight)) {
		var _dir = point_direction(x, y, _insideLight.x, _insideLight.y);
		var _len = random_range(200, 1000);
		_dir += 180 + random_range(-10, 10);
		destinationX = x + lengthdir_x(_len, _dir);
		destinationY = y + lengthdir_y(_len, _dir);
	}
	else {
		var repetitions = 0;
		do {
			if (repetitions > 200) {
				break;
			} 
			destinationX = oPlayer.x + random_range(-600-repetitions*10, 600+repetitions*10);
			destinationY = oPlayer.y + random_range(-600-repetitions*10, 600+repetitions*10);
			
			var _noLightableCrossed = true;
			for (var i=0; i< array_length(global.ILightables); i++) {
				var _lightable/*:ILight*/ = global.ILightables[i];
				with (_lightable) {
					if (circle_line_collides(other.x, other.y, other.destinationX, other.destinationY, x, y, displayLightRange*260)) {
						_noLightableCrossed = false;
						break;
					}
				}
			}
			repetitions++;
		} until (_noLightableCrossed);
	}
}

selectDestination();
