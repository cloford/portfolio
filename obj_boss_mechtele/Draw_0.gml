/// @desc　本体描画はdepth systemで

//線分描画（directionへ）debug
var d_x = lengthdir_x(300,direction);
var d_y = lengthdir_y(300,direction);
draw_line(x,y, x + d_x, y + d_y);