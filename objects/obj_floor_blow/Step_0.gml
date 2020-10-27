blow_count ++;
if(blow_count == blow_time)
{
	if(place_empty(x,y) == false)
	{
		blow_list = ds_list_create();
		num = instance_place_list(x,y,obj_parent_actor,blow_list,false);
		if num > 0
		{
			for (var i = 0; i < num; ++i;)
			{
				blow_list[| i].effect_blow = id;		
			}
		}
	}
	else 
	{
		blow_count = 0;
	}
}
if(blow_count > blow_time + blow_move_time) 
{
	blow_count = 0;
}
