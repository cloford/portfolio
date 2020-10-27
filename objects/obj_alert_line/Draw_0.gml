/// @description Insert description here
// You can write your code in this editor

if(cast_count > 0)
{
	alert_alpha = 1 - (cast_count / cast_time);
	draw_set_color(c_red);
	draw_set_alpha(alert_alpha)
	draw_line_width(x, y, range_end_x, range_end_y,2);
	draw_set_alpha(1);
	draw_set_color(c_white);
}
else
{
	draw_self();
}