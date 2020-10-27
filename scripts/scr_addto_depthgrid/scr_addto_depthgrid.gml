///@desc

with(obj_sys_draw)
{
	if (!ds_exists(ds_depthgrid, ds_type_grid))
	{
		///creat the depthgrid datastructure
		ds_depthgrid = ds_grid_create(2,1);

		//add its ID to the grid
		ds_depthgrid[# 0,0] = other;

		//add its Y value to the grid
		ds_depthgrid[# 1,0] = other.y;
	}
	else
	{
		//resize the current grid (increment +1)
		var height_of_grid = ds_grid_height(ds_depthgrid);
		ds_grid_resize(ds_depthgrid, 2, height_of_grid +1);
		
		//add ourselves to grid
		ds_depthgrid[# 0,height_of_grid] = other;
		
		//add our Y value
		ds_depthgrid[# 1,height_of_grid] = other.y;
	}
}
