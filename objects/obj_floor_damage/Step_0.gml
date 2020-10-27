/// @description Insert description here
// You can write your code in this editor


if(place_empty(x,y) == false)
{
	count_start = true;	
}

if(count_start == true)
{
	count += 1;
	if(count >= count_cap)
	{
		var list = ds_list_create();
		var num = instance_place_list(x, y, obj_parent_actor, list, false);
		if num > 0
		{
		    for (var i = 0; i < num; ++i;)
			{
				  list[| i].damage += 1;
		    }
		}
		ds_list_destroy(list);
		count = 0;
		count_start = false;
	}
}

