/// @description Drawing Markov chain visuals
// start by picking the first index and drawing at top of circle
//draw_circle_color(CENX, CENY - RAD, NODE_RAD, NODE_COL, NODE_COL, true)
//draw_text_color(CENX + TEXT_OFFSET_X, CENY - RAD + TEXT_OFFSET_Y, S[0], NODE_COL, NODE_COL, NODE_COL, NODE_COL, 1)
//draw_circle_color(CENX, CENY, 10, NODE_COL, NODE_COL, false)

// draw background on the right
draw_set_alpha(MENU_ALPHA)
draw_rectangle_color(room_width / 2, 0, room_width, room_height, MENU_COL, MENU_COL, MENU_COL, MENU_COL, false)


draw_set_alpha(1)
draw_set_color(c_black)
// draw edges first; connects each node for each node
for(var i = 0; i < array_length(P); i++){
	// center of start node
	var ix = CENX + dcos(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	var iy = CENY + dsin(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	
	for(var j = 0; j < array_length(P[0]); j++){
		// don't draw connections to itself or probability == 0
		if(i != j && P[i][j] > 0){
			// center of recieving node
			var jx = CENX + dcos(DIAM_DEG * j - 90*(array_length(S) > 2))*RAD
			var jy = CENY + dsin(DIAM_DEG * j - 90*(array_length(S) > 2))*RAD
			
			// account for radius of circle / offset
			// degree
			var dir = darctan2((jy - iy), (jx - ix))
			
			draw_arrow(ix, iy, jx, jy, ARROW_WIDTH)
			//draw_line_width_color(ix, iy, jx, jy, EDGE_WIDTH, NODE_COL, NODE_COL)
		}
	}
}

// next draw nodes equally spaced along circle
for(var i = 0; i < array_length(S); i++){
	var tx = CENX + dcos(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	var ty = CENY + dsin(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	draw_circle_color(tx, ty, NODE_RAD, NODE_COL, NODE_COL, false)
	draw_circle_color(tx, ty, INNER_NODE_RAD, INNER_NODE_COL, INNER_NODE_COL, false)
	draw_text_color(tx + TEXT_OFFSET_X, ty + TEXT_OFFSET_Y, S[i], NODE_COL, NODE_COL, NODE_COL, NODE_COL, 1)	
}
