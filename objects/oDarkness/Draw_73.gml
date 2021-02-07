
timer++;

if (!surface_exists(surf)) {
	surf = surface_create(oCamera.width+2, oCamera.height+2);	
}

var _lightStrength = 0;
if (lightningStrength > 0) {
	if (lightningStrength < 0.5) {
		_lightStrength = 1 - lightningStrength*2;
	} else {
		_lightStrength = lightningStrength*2;
	}
}

if (surface_exists(surf)) {
	
	surface_set_target(surf);
	camera_apply(oCamera.cam);

	
	draw_clear_alpha(c_black, 0.99 - _lightStrength/2);
	
	for (var i=0;i < array_length(global.ILightables); i++) {
		var _lightable/*:ILight*/ = global.ILightables[i];
		if (_lightable.displayLightStrength <= 0) {
			continue;
		}
		with (_lightable) {
			var _s = random_range(displayLightRange*1.2, displayLightRange*1.3);
			draw_sprite_ext(sFeather, 0, x+displayLightOffsetX, y+displayLightOffsetY, _s, _s, 0, c_red, displayLightStrength);
			draw_sprite_ext(sFeather, 0, x+displayLightOffsetX+random_range(-2, 2), y+random_range(-2, 2)+displayLightOffsetY, _s, _s, 0, c_red, displayLightStrength);
		}
	}
	
	gpu_set_blendmode(bm_subtract);
	
	draw_sprite_tiled_ext(sCloudTile,0, timer, timer, 1.2, 0.7, c_white, 0.015);
	draw_sprite_tiled_ext(sCloudTile,0, -timer, -timer*2, 0.6, 1.1, c_white, 0.015);
	draw_sprite_tiled_ext(sCloudTile,0, timer, timer*2, 2, 2, c_white, 0.015);
	for (var i=0;i < array_length(global.ILightables); i++) {
		var _lightable/*:ILight*/ = global.ILightables[i];
		if (_lightable.displayLightStrength <= 0) {
			continue;
		}
		with (_lightable) {
			var _s = random_range(displayLightRange*1, displayLightRange*1.1);
			draw_sprite_ext(sFeather, 0, x+displayLightOffsetX, y+displayLightOffsetY, _s, _s, 0, c_white, displayLightStrength*0.5);
			draw_sprite_ext(sFeather, 0, x+displayLightOffsetX+random_range(-2, 2), y+random_range(-2, 2)+displayLightOffsetY, _s, _s, 0, c_white, displayLightStrength*0.5);
		}
	}
	
	gpu_set_blendmode(bm_normal);
	
	for (var i=0;i < array_length(global.ILightables); i++) {
		var _lightable/*:ILight*/ = global.ILightables[i];
		if (_lightable.displayLightStrength <= 0) {
			continue;
		}
		with (_lightable) {
			var _s = random_range(displayLightRange*1.2, displayLightRange*1.3);
			draw_sprite_ext(sFeather, 0, x+displayLightOffsetX, y+displayLightOffsetY, _s, _s, 0, c_red, displayLightStrength*0.1);
			draw_sprite_ext(sFeather, 0, x+displayLightOffsetX+random_range(-2, 2), y+random_range(-2, 2)+displayLightOffsetY, _s, _s, 0, c_red, displayLightStrength*0.1);
		}
	}
	
	surface_reset_target();
	
	draw_surface(surf, oCamera.x0-1, oCamera.y0-1);
	if (lightningStrength > 0) {
		draw_set_alpha(lightningStrength/3);
		draw_set_color(c_white)
		draw_rectangle(oCamera.x0-1, oCamera.y0-1, oCamera.x1+1, oCamera.y1+1, false);
		draw_set_alpha(1);
	}
}