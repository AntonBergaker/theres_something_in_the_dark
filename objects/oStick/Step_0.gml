canPickUp = (point_distance(x, y, oPlayer.x, oPlayer.y) < 100);
if (canPickUp && keyboard_check_pressed_once("E")) {
	oPlayer.sticks++;
	instance_destroy();
}
