/// @description Checking stochastic matrix

// checking stochastic matrix


// moving individual nodes with mouse
if(mouse_check_button(mb_left) and !dragging_all){
	if!(dragging_node){
		// check if any overlaps between node positions exists
		for(var i = 0; i < array_length(S); i++){
			nodex = node_cords[i][0]
			nodey = node_cords[i][1]
		
			if(sqrt(sqr(mouse_x - nodex) + sqr(mouse_y - nodey)) < node_rad){
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
		var mx = (mouse_x < room_width / 2 - node_rad) and (mouse_x > node_rad)
		var my = (mouse_y < room_height - node_rad) and (mouse_y > node_rad)
		
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


// dragging entire group
if(mouse_check_button(mb_middle)){
	if!(dragging_all){
		// setting dx and dy for each node
		for(var i = 0; i < array_length(S); i++){
			array_push(ddrag, [node_cords[i][0] - mouse_x, node_cords[i][1] - mouse_y])
		}
		
		// + 1 additional index for cenx, ceny offset
		array_push(ddrag, [cenx - mouse_x, ceny - mouse_y])
		
		dragging_all = true
	}
	
	// moving each node based on dx and dy
	for(var i = 0; i < array_length(S); i++){
		node_cords[i][0] = mouse_x + ddrag[i][0]
		node_cords[i][1] = mouse_y + ddrag[i][1]
	}
	
	// moving cenx, ceny
	cenx = mouse_x + ddrag[array_length(ddrag) - 1][0]
	ceny = mouse_y + ddrag[array_length(ddrag) - 1][1]
	
}
else {
	// reset ddrag and dragging_all
	array_delete(ddrag, 0, array_length(ddrag))
	
	dragging_all = false
}


// zooming in
if(mouse_wheel_up()){
	// move each node outwards away from cenx and ceny
	for(var i = 0; i < array_length(S); i++){
		var deg = darctan2(node_cords[i][1] - ceny, node_cords[i][0] - cenx)
		
		node_cords[i][0] += dcos(deg) * ZOOM_SPEED
		node_cords[i][1] += dsin(deg) * ZOOM_SPEED
	}
	// node_rad += ZOOM_SPEED / 3
}

// zooming out
if(mouse_wheel_down()){
	// move each node inwards towards cenx and ceny
	for(var i = 0; i < array_length(S); i++){
		var deg = darctan2(node_cords[i][1] - ceny, node_cords[i][0] - cenx)
		
		node_cords[i][0] -= dcos(deg) * ZOOM_SPEED
		node_cords[i][1] -= dsin(deg) * ZOOM_SPEED
	}
	// node_rad += ZOOM_SPEED / 3
}