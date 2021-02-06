if (heat < 30) {
	draw_sprite_ext(sFrozen, 0, 0, 0, 1, 1, 0, c_white, (1 - heat/30)/3);	
}
if (dead) {
	exit;
}
draw_set_font(fPopup);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_text(10, 1080-10, string(sticks) + " " + (sticks == 1 ? "stick" : "sticks"));

var _posX = pos_to_gui_x(x);
var _posY = pos_to_gui_y(y);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

if (canLightNewTorch) {
	draw_text(_posX, _posY+100, "Press Q to light new torch");
}

if (canStartNewFire) {
	draw_text(_posX, _posY-200, "Press E to start new fire (-3 sticks)");
}