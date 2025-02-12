/// @description Runs the Markov chain
	
// initializing arrays	
S = [1, 2, 3, 4]
P = [[0, 0, 0.2],
	[0, 0.3, 0.6],
	[0.4, 0, 0]
	]


// markov vars
RAD = 150
cenx = room_width / 4
ceny = room_height / 2

node_rad = 25
NODE_COL = c_black
inner_node_rad = node_rad - 4
INNER_NODE_COL = c_white

DIAM_DEG = 360 / array_length(S)
TEXT_OFFSET_X = -4
TEXT_OFFSET_Y = -10
EDGE_WIDTH = 3
ARROW_WIDTH = 10

EDGE_OFFSET = 15
EDGE_NODE_OFFSET = 5
EDGE_TEXT_OFFSET = 20

// starting positions of nodes
node_cords = []
for(var i = 0; i < array_length(S); i++){
	var tx = cenx + dcos(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	var ty = ceny + dsin(DIAM_DEG * i - 90*(array_length(S) > 2))*RAD
	array_push(node_cords, [tx, ty])
}

// vars for dragging nodes
nodex = 0
nodey = 0
index = 0
dx = 0
dy = 0
dragging_node = false
dragging_all = false
ddrag = []			// delta drag array of [dx, dy] for each node
ZOOM_SPEED = 15		// number of pixels moved for each scroll of mouse


// menu vars
MENU_COL = c_gray
MENU_ALPHA = 0.4
