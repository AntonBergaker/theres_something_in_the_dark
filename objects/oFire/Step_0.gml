if (fuel <= 0) {
	displayLightStrength = 0;
	displayLightRange = 0;
} else {
	fuel -= 1/60;
	displayLightStrength = clamp(fuel/60 + 0.2, 0, 1);
	displayLightRange = displayLightStrength * 3;
	torchTimer += 15/60;
}

var _playerInRange = (distance_to_object(oPlayer) < 120);

playerCanIgnite = _playerInRange && oPlayer.hasTorch == false && oPlayer.sticks > 0 && displayLightStrength > 0;
playerCanDeposit = _playerInRange && oPlayer.sticks > 0;

if (playerCanIgnite && keyboard_check_pressed_once("Q")) {
	oPlayer.torchFuel = 60;
	oPlayer.hasTorch = true;
	oPlayer.sticks--;
	audio_play_sound(sndMatch, 1, false);
}

if (playerCanDeposit && keyboard_check_pressed_once("E")) {
	fuel += 30;
	oPlayer.sticks--;
}

var _dist = point_distance(x, y, oPlayer.x, oPlayer.y);
var _volume =  clamp(1.5 - _dist/360, 0, 1);
_volume *= clamp(displayLightStrength*2, 0, 1);

if (audio_is_playing(sound) == false && _volume > 0) {
	sound = audio_play_sound(sndCampfire, 0, true);
}
if (audio_is_playing(sound) && _volume <= 0) {
	audio_stop_sound(sound);
}
if (audio_is_playing(sound)) {
	audio_sound_gain(sound, _volume, 0);	
}