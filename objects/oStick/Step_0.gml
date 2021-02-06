canPickUp = (point_distance(x, y, oPlayer.x, oPlayer.y) < 100);
if (canPickUp && keyboard_check_pressed(ord("E"))) {
	oPlayer.sticks++;
	instance_destroy();
}
