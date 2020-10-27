/// @description save to hideout

cursor_sprite = spr_mouse;

//buy_reset
var inv_x = 0;
var inv_y = 0;

while(inv_y < inv_height)
{
	if(inventory_buy[inv_x, inv_y] = true)	//buyflagがtrueなら、そこをクリア
	{
		inventory_buy[inv_x, inv_y] = false;
		var clr_id = inventory [inv_x, inv_y];		
		var inv_w = real(obj_sys_manager.file_csv_item[# 4,clr_id]);
		var inv_h = real(obj_sys_manager.file_csv_item[# 5,clr_id]);
		var dd_x = inv_x;
		var dd_y = inv_y;
		var dd_w = inv_x + inv_w;
		var dd_h = inv_y + inv_h;
		while(dd_y < dd_h)
		{
			inventory		 [dd_x,dd_y] = 0;
			inventory_lump	 [dd_x,dd_y] = 0;
			inventory_amount [dd_x,dd_y] = 1;
			dd_x += 1;
			if(dd_x >= dd_w)
			{
				dd_x = inv_x;
				dd_y += 1;
			}
		}
	}
	inv_x += 1;
	if(inv_x >= inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}


//inventory
creator.inventory			= inventory;
creator.inventory_amount	= inventory_amount;

global.inv_lump_number = 0;

//sellshopなら強制売却
if(instance_exists(obj_rm_sellshop))
{
	with(obj_rm_sellshop) 
	{
		if(can_deal == true) event_user(1);
	}
}