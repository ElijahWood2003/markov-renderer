/// @description Runs the Markov chain
S = [1, 2, 3, 4]
P = [[0.2, 0, 0.4],
	[0, 0.3, 0.4],
	[0.2, 0.3, 0.4]
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


// menu vars
MENU_COL = c_gray
MENU_ALPHA = 0.4