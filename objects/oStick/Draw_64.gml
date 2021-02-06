
if (canPickUp) {
	var _posX = pos_to_gui_x(x);
	var _posY = pos_to_gui_y(y);
	draw_set_font(fPopup);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(_posX, _posY-100, "Press E to pick up stick");
}
