/// @description Drawing Markov chain visuals
// start by picking the first index and drawing at top of circle
//draw_circle_color(CENX, CENY - RAD, NODE_RAD, NODE_COL, NODE_COL, true)
//draw_text_color(CENX + TEXT_OFFSET_X, CENY - RAD + TEXT_OFFSET_Y, S[0], NODE_COL, NODE_COL, NODE_COL, NODE_COL, 1)
//draw_circle_color(CENX, CENY, 10, NODE_COL, NODE_COL, false)


draw_set_color(c_black)

// draw edges first; connects each node for each node
for(var i = 0; i < array_length(S); i++){
	// center of node
	var nodex = node_cords[i][0]
	var nodey = node_cords[i][1]
	//var ix = CENX + dcos(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	//var iy = CENY + dsin(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	
	for(var j = 0; j < array_length(S); j++){
		// don't draw connections to itself or probability == 0
		if(i != j && P[i][j] > 0){
			// recieving node
			var rec_nodex = node_cords[j][0]
			var rec_nodey = node_cords[j][1]
			
			// account for radius of circle / offset
			var dir = darctan2((nodey - rec_nodey), (nodex - rec_nodex))
			var ix = nodex - dcos(dir)*(node_rad + EDGE_NODE_OFFSET)
			var iy = nodey - dsin(dir)*(node_rad + EDGE_NODE_OFFSET)
			var rx = rec_nodex + dcos(dir)*(node_rad + EDGE_NODE_OFFSET)
			var ry = rec_nodey + dsin(dir)*(node_rad + EDGE_NODE_OFFSET)
			
			// make edges have an offset perpendicular to direction IFF there is an edge coming towards it
			var edge_offx = dcos(dir - 90) * EDGE_OFFSET * (P[j][i] > 0)
			var edge_offy = dsin(dir - 90) * EDGE_OFFSET * (P[j][i] > 0)
			
			
			// make edge text perpendicular to direction
			
			// calculations based on single or double edges to get offset of x and y for edge text
			var text_offx = (dsin(dir) * EDGE_TEXT_OFFSET + dsin(dir) * (dir > 0) * (dir < 180) * 4 * (P[j][i] > 0) + dsin(dir) * (9 / (1 + (P[j][i] == 0)) * string_length(P[i][j])) * (dir < 0) - abs(dcos(dir)) * (4 * string_length(P[i][j]))) * (P[j][i] >= 0)
							//- ((P[j][i] == 0) * abs(dcos(dir)) * (4 * string_length(P[i][j])) - 4)
			var text_offy = dcos(dir) * EDGE_TEXT_OFFSET + ((dir > 90) + (dir < -90)) * dcos(dir)*10 * (P[j][i] > 0) + (abs(dcos(dir)) * (dir < 90) * (dir > -90) * 13) * (P[j][i] > 0)
			
			
			// select color
			if(select_node == i){
				draw_set_color(SELECT_NODE_COL)
			}
			
			
			//draw_curve(ix, iy, rx, ry, degtorad(dir -90), 30)
			draw_arrow(ix + edge_offx, iy + edge_offy, rx + edge_offx, ry + edge_offy, ARROW_WIDTH)
				
			draw_text((rx - ix)/2 + ix + text_offx, (ry - iy)/2 + iy - text_offy - 10, P[i][j])
			
			draw_set_color(c_black)
		}
	}
}

// next draw nodes based on their nodex and nodey
for(var i = 0; i < array_length(S); i++){
	var nodex = node_cords[i][0]
	var nodey = node_cords[i][1]
	
	// drawing node
	if(state == i and run_chain){
		draw_circle_color(nodex, nodey, node_rad, STATE_NODE_COL, STATE_NODE_COL, false)
	}
	else if(select_node == i){
		draw_circle_color(nodex, nodey, node_rad, NODE_COL, SELECT_NODE_COL, false)
	}
	else {
		draw_circle_color(nodex, nodey, node_rad, NODE_COL, NODE_COL, false)
	}
	
	if(state == i and run_chain){
		draw_circle_color(nodex, nodey, inner_node_rad, STATE_INNER_NODE_COL, STATE_INNER_NODE_COL, false)
	}
	else {
		draw_circle_color(nodex, nodey, inner_node_rad, INNER_NODE_COL, INNER_NODE_COL, false)
	}
	
	draw_text_color(nodex + TEXT_OFFSET_X, nodey + TEXT_OFFSET_Y, S[i], NODE_COL, NODE_COL, NODE_COL, NODE_COL, 1)	

}
