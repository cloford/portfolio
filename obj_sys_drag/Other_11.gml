/// @description drag自身が生成されたとき


if(from_equip == true) //from_equipment
{
	drag_item = creator.click_id;	//itemID
	sprite_index = asset_get_index(obj_sys_manager.file_csv_item[# 2, creator.click_id]);	
	drag_ID = creator.click_equip;	//元の装備スロットの位置
	drag_amount = 1;			//装備品のamountは原則1（要検討）
	drag_inv_x = 0;
	drag_inv_y = 0;
	drag_inv_w = real(obj_sys_manager.file_csv_item[# 4, creator.click_id]);
	drag_inv_h = real(obj_sys_manager.file_csv_item[# 5, creator.click_id]);
}
else //from_inventory
{
	
	drag_item = creator.click_id;	//itemID
	sprite_index = asset_get_index(obj_sys_manager.file_csv_item[# 2, creator.click_id]);	
	drag_amount = creator.click_amount;
	drag_inv_x = creator.click_inv_x;
	drag_inv_y = creator.click_inv_y;
	drag_inv_w = creator.click_inv_w;
	drag_inv_h = creator.click_inv_h;
	if(in_shop) buying = creator.inventory_buy[creator.click_inv_x, creator.click_inv_y];
}