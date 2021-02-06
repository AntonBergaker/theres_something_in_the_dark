fuel -= 1/60;
displayLightStrength = clamp(fuel/60 + 0.2, 0, 1);
displayLightRange = displayLightStrength * 3;
torchTimer += 15/60;

var _playerInRange = (distance_to_object(oPlayer) < 120);

playerCanIgnite = _playerInRange && oPlayer.hasTorch == false && oPlayer.sticks > 0 && displayLightStrength > 0;
playerCanDeposit = _playerInRange && oPlayer.sticks > 0;

if (playerCanIgnite && keyboard_check_pressed(ord("Q"))) {
	oPlayer.torchFuel = 60;
	oPlayer.hasTorch = true;
	oPlayer.sticks--;
}

if (playerCanDeposit && keyboard_check_pressed(ord("E"))) {
	fuel += 30;
	oPlayer.sticks--;
}

