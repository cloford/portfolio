/// @description Insert description here
// You can write your code in this editor



var col = c_white;

if (found_player == true)
{
	col = c_red;
}

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, direction, col, 1);

// 視界範囲の右側を線分で描画
var dx1 = lengthdir_x(view_distance, direction-view_angle);
var dy1 = lengthdir_y(view_distance, direction-view_angle);
draw_line_colour(x, y, x+dx1, y+dy1, col, col);

// 視界範囲の左側を線分で描画
var dx2 = lengthdir_x(view_distance, direction+view_angle);
var dy2 = lengthdir_y(view_distance, direction+view_angle);
draw_line_colour(x, y, x+dx2, y+dy2, col, col);

// 視界範囲の先端の左右をつなぐ
draw_line_colour(x+dx1, y+dy1, x+dx2, y+dy2, col, col);