/// @description 新たな位置にlump登録と仮ID1を登録
var dd_x = edit_to.select_inv_x;
var dd_y = edit_to.select_inv_y;
var dd_w = edit_to.select_inv_x + drag_inv_w;
var dd_h = edit_to.select_inv_y + drag_inv_h;
global.inv_lump_number += 1;
while(dd_y < dd_h)
{
	edit_to.inventory[dd_x,dd_y] = 1;
	edit_to.inventory_lump[dd_x,dd_y] = global.inv_lump_number;
	dd_x += 1;
	if(dd_x >= dd_w)
	{
		dd_x = edit_to.select_inv_x;
		dd_y += 1;
	}
}

//新たな位置にitem ID, amount, spriteを登録
var et_x = edit_to.select_inv_x;
var et_y = edit_to.select_inv_y;

edit_to.inventory		[et_x, et_y] = drag_item;
edit_to.inventory_amount[et_x, et_y] = drag_amount;
edit_to.inventory_sprite[et_x, et_y] = sprite_index;
if(buying == true)
{
	creator.inventory_buy[drag_inv_x, drag_inv_y] = false;
	edit_to.inventory_buy[et_x, et_y] = true;
}