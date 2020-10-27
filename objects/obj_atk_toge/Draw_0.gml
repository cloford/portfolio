/// @description 警告と弾の描写

if(check_fire == false)
{
	alert_alpha = 1 - (cast_count / cast_time);
	draw_set_color(c_red);
	draw_circle(x,y,64,true);
	draw_set_alpha(alert_alpha)
	draw_circle(x,y,64,false);
//	draw_line_width(x, y, range_end_x, range_end_y,2);
	draw_set_alpha(1);
	draw_set_color(c_white);
}
else
{
	draw_self();
}