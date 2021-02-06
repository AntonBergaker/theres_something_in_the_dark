
if (eaten) {
	exit;
}
var _x = x;
var _y = y;

if (heat < 30) {
	var _heatRand = 1 - heat/60;
	_x += random_range(-_heatRand, _heatRand)*2;
	_y += random_range(-_heatRand, _heatRand)*2;
}

if (hasTorch) {
	draw_sprite_ext(sPlayerTorch, 0, _x, _y, 1, 1, 0, c_white, 1);
	var _s = clamp(displayLightStrength, 0, 1);
	var _r = sin(torchTimer)*5;
	draw_sprite_ext(sPlayerTorchFire, torchTimer/2, _x-30, _y-117, _s, _s+sin(torchTimer*1.2)*0.1, _r, c_white, 1);
} else {
	draw_sprite_ext(sPlayer, 0, _x, _y, 1, 1, 0, c_white, 1);
}

