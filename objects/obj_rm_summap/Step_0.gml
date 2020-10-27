/// @description 実体をプレスクリック


var mx = mouse_x;
var my = mouse_y;

if(point_in_rectangle(mx, my, x, y, x + sprite_width, y + sprite_height))
{
	selected = true;
	draw_alpha = 1;
	if(mouse_check_button(mb_left))
	{
		if (press_time < duration)
		{
			press_counter = scr_ease_in_out(press_time, start, dest - start, duration);
			press_time++;
		}
		else if(move_start == false)
		{
			move_start = true;
			my_roommove = instance_create_layer(0,0,"instances",obj_sys_roommove);
			my_roommove.preroom = room;
			my_roommove.roommove_to = roommove_to;
		}
	}
	else
	{
		press_counter = floor(press_counter / 1.4);
		press_time = press_counter;
	}
}
else
{
	draw_alpha = 0.5;
	selected = false;
	press_counter = floor(press_counter / 1.4);
	press_time = press_counter;
}

