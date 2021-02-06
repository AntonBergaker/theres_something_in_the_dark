function circle_line_collides(x0/*:number*/, y0/*:number*/, x1/*:number*/, y1/*:number*/, cx/*:number*/, cy/*:number*/, cr/*:number*/) {
	
	if (point_in_circle(x0, y0, cx, cy, cr)) {
		return true;
	}
	if (point_in_circle(x1, y1, cx, cy, cr)) {
		return true;
	}
	
	var _dist = point_distance(x0, y0, x1, y1);
	var _dot = dot_product(x0, y0, x1, y1);
	var _closestX = x0 + _dot * (x1-x0);
	var _closestY = y0 + _dot * (y1-y0);
	
	if (point_in_line(x0, y0, x1, y1, _closestX, _closestY) == false) {
		return false;
	}
	if (point_distance(_closestX, _closestY, cx, cy) < cr) {
		return true;
	}
	return false;
}


function point_in_line(x0, y0, x1, y1, px, py) {
	return
		(point_distance(x0, y0, px, py) + point_distance(px, py, x1, y1))
		== point_distance(x0, y0, x1, y1);
	
}