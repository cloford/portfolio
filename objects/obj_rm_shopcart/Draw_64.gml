/// @description inventoryのdrawgui + buyitemは赤枠

// Inherit the parent event
event_inherited();

//購入予定アイテムの枠線を赤色で上書き
var dr_x = 0;
var dr_y = 0;
while(dr_y < inv_height)
{
	if(inventory_buy[dr_x, dr_y] == true)
	{
		var dr_id = inventory[dr_x, dr_y];
		var ixsize = real(obj_sys_manager.file_csv_item[# 4, dr_id]);
		var iysize = real(obj_sys_manager.file_csv_item[# 5, dr_id]);
		var ix1 = inv_gui_buffer_x + (dr_x * inv_box_size);
		var iy1 = inv_gui_buffer_y + (dr_y * inv_box_size);
		var ix2 = inv_gui_buffer_x + (dr_x * inv_box_size + (inv_box_size * ixsize));
		var iy2 = inv_gui_buffer_y + (dr_y * inv_box_size + (inv_box_size * iysize));
		//枠線を描画
		draw_set_color(c_red);
		draw_rectangle(ix1,iy1,ix2,iy2,true);
	}
	
	dr_x += 1;
	if(dr_x >= inv_width)
	{
		dr_y += 1;
		dr_x = 0;
	}
}
draw_set_color(c_white);