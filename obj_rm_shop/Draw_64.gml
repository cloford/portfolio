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
	var y2 = y1 + (select_inv_w * global.inv_box_size);
	draw_rectangle(x1,y1,x2,y2,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}

//購入ボタンを表示
draw_set_alpha (tradeb_alpha);
draw_sprite(spr_rm_shop_buy,0,tradeb_x,tradeb_y);
draw_set_alpha(1);

//moneyとtotal_priceを表示
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(money_draw_x, money_draw_y, "money : " + string(obj_rm_hideout.money) + " - " + string(total_price));
draw_set_halign(fa_left);

//所持金以上の価格を提示されたら変えない（赤字）
if(can_deal == false)
{
	draw_set_color(c_red);
	draw_line_width(tradeb_x,tradeb_y,tradeb_x + tradeb_w,tradeb_y + tradeb_h,2);
	draw_set_color(c_white);
}

//カウンターが上昇中は四角形がもぁ〜んってなる
if(press_counter > 0)
{
	gpu_set_blendmode_ext(bm_inv_dest_color,bm_zero);
	draw_rectangle(tradeb_x,tradeb_y,tradeb_x + press_counter,tradeb_y + tradeb_h -1,false);
	gpu_set_blendmode(bm_normal);
}

