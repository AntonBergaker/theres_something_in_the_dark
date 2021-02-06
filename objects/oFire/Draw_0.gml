draw_sprite(sFireWood, 0, x, y);

if (displayLightStrength > 0) {
	var _s = clamp(displayLightStrength, 0, 1);
	var _r = sin(torchTimer/3)*5;
	draw_sprite_ext(sFireFire, torchTimer/2, x, y, _s, _s+sin(torchTimer*0.5)*0.1, _r, c_white, 1);
}