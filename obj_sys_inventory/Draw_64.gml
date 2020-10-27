/// @description インベントリ描画

if(init_end == false) return;

scr_inventory_draw();

//selectマスの強調色
if(instance_exists(obj_sys_drag))
{
	if(can_drop == true)	var invcol = c_green;
	else					var invcol = c_red;
	if(can_stack == true)	var invcol = c_yellow;
}
else
{
	var invcol = c_white;
}

//selectマスを強調
if(select_inv_x >= 0)
{
	draw_set_color(invcol);
	draw_set_alpha(0.5);
	var x1 = inv_gui_buffer_x + (select_inv_x * global.inv_box_size);
	var y1 = inv_gui_buffer_y + (select_inv_y * global.inv_box_size);
	var x2 = x1 + (select_inv_w * global.inv_box_size);
	var y2 = y1 + (select_inv_h * global.inv_box_size);
	draw_rectangle(x1,y1,x2,y2,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}



//debug
draw_text(300,160,select_inv_x);
draw_text(300,180,select_inv_y);