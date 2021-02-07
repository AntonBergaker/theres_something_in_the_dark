lightningTimer -= 1/60;

if (lightningTimer <= 0.2) {
	if (!audio_is_playing(sndThunder)) {
		audio_play_sound(sndThunder, 1, false);
	}
}

if (lightningTimer <= 0) {
	lightningTimer = random_range(5, 90);
	lightningStrength = 1;
}

lightningStrength-= 0.05;
lightningStrength = clamp(lightningStrength, 0, 1);