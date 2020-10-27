///@desc アイドルAI：きょろきょろ
//適当に周りを見回す。

idle_count ++;
if(idle_count >= idle_time)
{
	if(idle_direction_check == false)
	{
		var idle_angle_x = irandom(room_width);
		var idle_angle_y = irandom(room_height);
		var search_around = point_direction(x, y, idle_angle_x, idle_angle_y);
		idle_angle = angle_difference(neck_direction,search_around);
		idle_direction_check = true;
	}
	if(idle_direction_check == true)
	{
		neck_direction += idle_angle/neck_speed;
	}
	if(idle_count >= idle_time + neck_speed)
	{
		idle_count = 0;
		idle_direction_check = false;
	}
}