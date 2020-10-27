/// @description 売却予定額をチェック

if(mouse_check_button_released(mb_left))
{
	var inv_x = 0;
	var inv_y = 0;
	var t_price = 0;
	while(inv_y < inv_height)
	{
		//id 0と1以外なら価格をチェックしpriceに反映
		if(inventory[inv_x,inv_y] > 2) 
		{
			var t_id	 = inventory[inv_x,inv_y];
			var t_amount = inventory_amount[inv_x,inv_y];
			t_price += (t_amount * real(obj_sys_manager.file_csv_item[# 3, t_id]));
		}
		inv_x += 1;
		if(inv_x >= inv_width)
		{
			inv_y += 1;
			inv_x = 0;
		}
	}
	total_price = t_price;
}