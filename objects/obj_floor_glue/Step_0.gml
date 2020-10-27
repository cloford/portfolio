glue_list = ds_list_create();
num = instance_place_list(x,y,obj_parent_actor,glue_list,false);
if num > 0
{
	for (var i = 0; i < num; ++i;)
	{
		glue_list[| i].glue_power = glue_power;
		glue_list[| i].glue_time = glue_time;
		glue_list[| i].effect_glue = id;
	}
}




ds_list_destroy(glue_list);


