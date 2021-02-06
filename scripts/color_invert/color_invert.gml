function color_invert(color/*: int*/) /*-> int*/ {
	return make_color_rgb(
		255 - color_get_red(color),
		255 - color_get_green(color),
		255 - color_get_blue(color)
	);
}