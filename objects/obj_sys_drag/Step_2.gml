/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_sys_inventory) == false)
{
	instance_destroy(self);
}

if(mouse_check_button_released(mb_left))
{
	if(clear_start == false) //dropそのものに失敗したとき（置く場所なかったとき）
	{
		//元の位置のlumpを戻す。
		global.inv_lump_number += 1;
		var ix = drag_inv_x;
		var iy = drag_inv_y;
		var iw = ix + drag_inv_w;
		var ih = iy + drag_inv_h;
		while (iy < ih)
		{
			creator.inventory_lump[ix,iy] = global.inv_lump_number;
			ix += 1;
			if(ix >= iw)
			{
				ix = drag_inv_x;
				iy += 1;
			}
		}
	}
	
	instance_destroy(self);
}