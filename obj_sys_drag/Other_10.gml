/// @description Clear ID


if(from_equip == true)	//元の装備スロットをクリア
{
	creator.equipment_slot[drag_ID] = 0;
	creator.slot_update[drag_ID] = true;
}
else					//元のinventoryスロットをクリア
{
	var dd_x = drag_inv_x;
	var dd_y = drag_inv_y;
	var dd_w = drag_inv_x + drag_inv_w;
	var dd_h = drag_inv_y + drag_inv_h;
	while(dd_y < dd_h)
	{
		creator.inventory		 [dd_x,dd_y] = 0;
		creator.inventory_lump	 [dd_x,dd_y] = 0;
		creator.inventory_amount [dd_x,dd_y] = 1;
		creator.inventory_sprite [dd_x,dd_y] = 0;
		dd_x += 1;
		if(dd_x >= dd_w)
		{
			dd_x = drag_inv_x;
			dd_y += 1;
		}
	}
}