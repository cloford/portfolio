if(obj_player.key_intract == true)
{
	if(distance_to_object(obj_player) <= 50) and (place_meeting(x,y,obj_player) == false)
	{
		if(open == false)
		{
			image_index = 1;
			scr_sound_set(se_door_open)
			open = true;
			solid = false;
		}
		else
		{
			image_index = 0;
			scr_sound_set(se_door_close);
			open = false;
			solid = true;
		}
	}
}