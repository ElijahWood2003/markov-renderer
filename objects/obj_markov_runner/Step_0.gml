/// @description Checking stochastic matrix

// checking stochastic matrix


// moving nodes with mouse
if(mouse_check_button(mb_left)){
	if!(dragging_node){
		// check if any overlaps between node positions exists
		for(var i = 0; i < array_length(S); i++){
			nodex = node_cords[i][0]
			nodey = node_cords[i][1]
		
			if(sqrt(sqr(mouse_x - nodex) + sqr(mouse_y - nodey)) < NODE_RAD){
				dragging_node = true
				index = i
				dx = nodex - mouse_x
				dy = nodey - mouse_y
				break
			}
		}
	}
	else {
		// room border boolean vars
		var mx = (mouse_x < room_width / 2 - NODE_RAD) and (mouse_x > NODE_RAD)
		var my = (mouse_y < room_height - NODE_RAD) and (mouse_y > NODE_RAD)
		
		// delta x and delta y of mouse for stable adjustment
		if(mx){
			node_cords[index][0] = mouse_x + dx
		}
		if(my){
			node_cords[index][1] = mouse_y + dy
		}
	}
}
else {
	dragging_node = false
}