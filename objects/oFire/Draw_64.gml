
draw_set_font(fPopup);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var _posX = pos_to_gui_x(x);
var _posY = pos_to_gui_y(y);


if (playerCanIgnite) {
	draw_text(_posX, _posY-100, "Press Q to light torch");
}
if (playerCanDeposit) {
	draw_text(_posX, _posY-150, "Press E to feed fire");
}