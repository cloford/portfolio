if place_meeting(x,y,obj_player)
{
	if (move_start)
	my_roommove = instance_create_layer(0,0,"lay_ins_player",obj_sys_roommove);
	my_roommove.preroom = room;
	my_roommove.roommove_to = roommove_to;
	move_start = false;
}	