/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();





if (my_c_flag > 1)
{
	if (!move_start) && (instance_exists(obj_sys_textbox) == false)
	{
		move_start = true;
		my_roommove = instance_create_layer(0,0,"lay_ins_player",obj_sys_roommove);
		my_roommove.preroom = room;
		my_roommove.roommove_to = roommove_list[my_c_flag-2];
	}
}
