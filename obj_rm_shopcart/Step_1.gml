/// @description 右クリックの挙動追加

if(mouse_check_button_released(mb_right))
{
	if(select_inv_x >= 0) and (inventory_buy[select_inv_x, select_inv_y] == true)
	{
		var rc_x = select_inv_x;
		var rc_y = select_inv_y;
		var rc_w = select_inv_x + select_inv_w;
		var rc_h = select_inv_y + select_inv_h;
		var rc_id = inventory [rc_x, rc_y];
		
		//shiftを押すか、あるいは1個だけならスタックごと消去
		if(inventory_amount [rc_x, rc_y] == 1) or (keyboard_check(vk_shift) == true)
		{
			
			var m_price = real(obj_sys_manager.file_csv_item[# 3, rc_id]) * inventory_amount[rc_x, rc_y];
			obj_rm_shop.total_price -= m_price;
			while(rc_y < rc_h)
			{
				inventory		 [rc_x, rc_y] = 0;
				inventory_lump	 [rc_x, rc_y] = 0;
				inventory_amount [rc_x, rc_y] = 1;
				inventory_sprite [rc_x, rc_y] = 0;
				inventory_buy	 [rc_x, rc_y] = false;
				rc_x += 1;
				if(rc_x >= rc_w)
				{
					rc_x = select_inv_x;
					rc_y += 1;
				}
			}
		}
		else //1個だけ削除
		{
			var m_price = real(obj_sys_manager.file_csv_item[# 3, rc_id])
			obj_rm_shop.total_price -= m_price;
			inventory_amount [rc_x, rc_y] -= 1;
		}
	}
}

