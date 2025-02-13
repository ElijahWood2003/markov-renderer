/// @description Drawing Menu
// draw background on the right
//draw_set_alpha(MENU_ALPHA)
draw_rectangle_color(room_width / 2, 0, room_width, room_height, MENU_COL, MENU_COL, MENU_COL, MENU_COL, false)


draw_set_color(c_black)
for(var i = 0; i < array_length(S); i++){
	for(var j = 0; j < array_length(S); j++){
		draw_text(MENU_MATRIX_STARTX + MENU_MATRIX_XSPACE*j, MENU_MATRIX_STARTY + MENU_MATRIX_YSPACE*i, P[i][j])
	}
}


draw_set_alpha(1)