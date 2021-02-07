depth = -y;
image_xscale = random_range(0.9, 1.1) * choose(-1, 1);
image_yscale = random_range(0.9, 1.1);
image_angle = random_range(-5, 5);
image_index = irandom(1);
image_speed = 0;

if (irandom(3) == 0) {
	var _r = random_range(100, 130);
	var _a = random(360);
	instance_create_depth(x+lengthdir_x(_r, _a), y+lengthdir_y(_r, _a), 0, oStick);
}