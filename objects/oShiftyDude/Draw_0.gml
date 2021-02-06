
draw_sprite_ext(sprite_index, 0, x, y, facingSide, 1, 0, c_white, 0.75 + sin(drawTimer/100)*0.25);
for (var i=0;i<5;i++) {
	draw_sprite_ext(sprite_index, 0,
		x+sin((1+i/15)*drawTimer/30 + i*123)*60,
		y+sin((1+i/20)*drawTimer/30 + i*163)*60, 
	facingSide, 1, 0, c_white, 0.3 + sin(i*1234+drawTimer/100)*0.1);
}
