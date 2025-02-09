/// @description Runs the Markov chain
	
// initializing arrays	
S = [1, 2, 3, 4]
P = [[0, 0.3, 0.4],
	[0.5, 0.3, 0.5],
	[0, 0, 0.1]
	]


// markov vars
RAD = 150
CENX = room_width / 4
CENY = room_height / 2

NODE_RAD = 25
NODE_COL = c_black
INNER_NODE_RAD = 20
INNER_NODE_COL = c_white

DIAM_DEG = 360 / array_length(S)
TEXT_OFFSET_X = -4
TEXT_OFFSET_Y = -10
EDGE_WIDTH = 3
ARROW_WIDTH = 6

EDGE_OFFSET = 5

// starting positions of nodes
node_cords = []
for(var i = 0; i < array_length(S); i++){
	var tx = CENX + dcos(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	var ty = CENY + dsin(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	array_push(node_cords, [tx, ty])
}

// vars for dragging nodes
nodex = 0
nodey = 0
index = 0
dx = 0
dy = 0
dragging_node = false


// menu vars
MENU_COL = c_gray
MENU_ALPHA = 0.4
