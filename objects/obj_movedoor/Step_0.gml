if place_meeting(x,y,obj_player)
{
	if keyboard_check_pressed(vk_space) && (obj_player.hascontrol)
	{
		my_roommove = instance_create_layer(0,0,"lay_ins_player",obj_sys_roommove);
		my_roommove.preroom = room;
		my_roommove.roommove_to = roommove_to;
	}
}		