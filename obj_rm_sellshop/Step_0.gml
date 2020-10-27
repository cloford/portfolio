
//ここにはshopcartとsellshopとhideout（動かない）がいる
//ほとんど普通のインベントリとして振る舞う
//マウス左クリックを離すたびにpriceを再チェック

//決済をすると
//priceがmoneyに反映され
//shopcartのinventoryがhideoutのinventoryに反映され
//こちらのinventoryが空になる

if(init_end == false) return;

var dmxg = device_mouse_x_to_gui(0);
var dmyg = device_mouse_y_to_gui(0);

#region //select
//インベントリ枠内にカーソルがあるなら
in_inv_box = point_in_rectangle(dmxg,dmyg,inv_gui_buffer_x,inv_gui_buffer_y,inv_gui_buffer_x + inv_gui_width,inv_gui_buffer_y + inv_gui_height)

if(in_inv_box == true)
{
	//select変数に1以上の変数を格納
	var tsi_x = floor((dmxg - inv_gui_buffer_x) / global.inv_box_size);
	var tsi_y = floor((dmyg - inv_gui_buffer_y) / global.inv_box_size);
	var otsi_x = tsi_x;
	var otsi_y = tsi_y;
	
	if(tsi_x < inv_width) and (tsi_y < inv_height)
	{
		//選択したマスの格納idが1の場合は、lumpチェックし左上原点を選択したとみなす。
		if(inventory[tsi_x,tsi_y] == 1) //and (instance_exists(obj_sys_drag) == false)
		{
			#region 原点チェックループ
			var doloop = true;
			while(doloop == true)
			{
				//左を見ても同じlumpaなら
				if(tsi_x != 0)
				{
					if(inventory_lump[tsi_x,tsi_y] == inventory_lump[tsi_x - 1,tsi_y])
					{
						tsi_x -= 1;
						continue;
					}
				}
				//左は違うランプ（ここは左端）なら
				if(tsi_y != 0)
				{
					if(inventory_lump[tsi_x,tsi_y] == inventory_lump[tsi_x,tsi_y - 1]) 
					{
						tsi_y -= 1;
						continue;
					}
				}
				//上も左も違うランプ（＝ここが左上端）
				doloop = false;
			}
			#endregion
		}
		select_id = inventory[tsi_x,tsi_y];
		if(select_id != 0)
		{
			select_inv_w = real(obj_sys_manager.file_csv_item[# 4,select_id]);
			select_inv_h = real(obj_sys_manager.file_csv_item[# 5,select_id]);
		}
		else
		{
			select_inv_w = 1;
			select_inv_h = 1;
		}
		select_inv_x = tsi_x;
		select_inv_y = tsi_y;
	}
	else //インベントリ枠内だがスロットの外
	{
		select_inv_x = -1;
		select_inv_y = -1;
	}
}
else //インベントリ枠外
{
	select_inv_x = -2;
	select_inv_y = -2;
}

//drag中
if(select_inv_x >= 0) and (instance_exists(obj_sys_drag))
{
	//選択アイテムidがdragアイテムidと同一で、かつ選択先のamountがまだ満タンでないならcan_stack
	if(obj_sys_drag.drag_item == select_id) and (real(obj_sys_manager.file_csv_item[# 6,select_id]) > inventory_amount[select_inv_x, select_inv_y])
	{
		can_stack = true;
	}
	else
	{
		can_stack = false;
	}
	//同一座標、同一インベントリならそれは自分自身なので、stack対象ではない
	if(obj_sys_drag.creator == id) and (select_inv_x == obj_sys_drag.drag_inv_x) and (select_inv_y == obj_sys_drag.drag_inv_y)
	{
		can_stack = false;
	}
}

if(select_inv_x >= 0) and (instance_exists(obj_sys_drag)) and (can_stack == false)
{
	//選択中の座標はlump loopをしない
	select_inv_x = otsi_x;
	select_inv_y = otsi_y;
	//drag中のアイテムの大きさをselect領域にする。
	select_inv_w = obj_sys_drag.drag_inv_w;
	select_inv_h = obj_sys_drag.drag_inv_h;
	
	//その領域のlumpがすべて空いているならcan_drop
	var ix = select_inv_x;
	var iy = select_inv_y;
	var iw = select_inv_x + select_inv_w;
	var ih = select_inv_y + select_inv_h;
	if(iw <= inv_width) and (ih <= inv_height) //インベントリスロット枠からはみ出ないなら
	{
		while(iy < ih)
		{
			if(inventory_lump[ix,iy] == 0)
			{
				can_drop = true;
				ix += 1;
				if(ix >= iw)
				{
					ix = select_inv_x;
					iy += 1;
				}
			}
			else
			{
				can_drop = false;
				break;
			}
		}
	}
	else //インベントリスロット枠からハミでてしまうなら
	{
		can_drop = false;
	}
}
else
{
	can_drop = false;
}

#endregion

#region //click

if (mouse_check_button_pressed(mb_left))
{
	//無以外の何かをselect中にマウスをクリックした
	if(select_inv_x >= 0) and (select_id != 0)
	{
		mode_click = true; //マウスポインタが合った時にクリックした場合のみクリックモード
		click_id = select_id; //クリックしたitem id
		click_inv_x = select_inv_x;
		click_inv_y = select_inv_y;
		click_inv_w = select_inv_w;
		click_inv_h = select_inv_h;
		click_amount = inventory_amount[click_inv_x,click_inv_y];
		mouse_grab_x = dmxg;
		mouse_grab_y = dmyg;
	}
}

#endregion

#region //drag

if (mode_click == true)
{
	if (mode_drag == false) //まだdragモードじゃないなら
	{
		//5dot以上動かしたらmode_drag
		var mxmoved = abs((mouse_grab_x) - (dmxg));
		var mymoved = abs((mouse_grab_y) - (dmyg));
		if(mxmoved >= 5) or (mymoved >= 5)
		{
			mode_drag = true;
			mydrag = instance_create_layer(dmxg,dmyg,"lay_gui_drag",obj_sys_drag);
			mydrag.creator = id;
			with(mydrag) event_user(1); //変数を持たせる

			//drag開始時点で自分の足元のlumpを0に。
			var ix = click_inv_x;
			var iy = click_inv_y;
			var iw = click_inv_x + click_inv_w;
			var ih = click_inv_y + click_inv_h;
			while (iy < ih)
			{
				inventory_lump[ix,iy] = 0;
				ix += 1;
				if(ix >= iw)
				{
					ix = click_inv_x;
					iy += 1;
				}
			}
		}
	}
}

#endregion

#region //release
if(mouse_check_button_released(mb_left))
{
	//drag中でなく、かつaltを押していたら（alt+release）
	if(instance_exists(obj_sys_drag) == false) and (keyboard_check(vk_alt)) and (mode_click == true)
	{
		//今clickされていない方のインベントリにmovetoを登録
		with(obj_sys_inventory) if(mode_click == false) other.moveto = id;
		
		if(moveto != noone) //対象がいるなら
		{
			var to_max_amount = real(obj_sys_manager.file_csv_item[# 6,click_id]);
	
			//スタックできる相手がいなくなるまで走査
			scr_item_stack_check(to_max_amount);
		
			//空きマス走査開始。成功したらcan_move
			scr_item_can_move_check(click_inv_w, click_inv_h);
		}
	}
	
	//drag中にマウスを離し、かつcan_stackなら
	if(instance_exists(obj_sys_drag) == true) and (can_stack == true) //stack成功
	{
		var sum_amount = inventory_amount[select_inv_x, select_inv_y] + obj_sys_drag.drag_amount;	//合算
		var to_amount_max = real(obj_sys_manager.file_csv_item[# 6,select_id])						//最大値

		//合算値がmax以下なら、合算して元の位置をクリア
		if(sum_amount <= to_amount_max)
		{
			inventory_amount[select_inv_x, select_inv_y] = sum_amount;
			//クリアフラグ：元居た場所のid消去
			obj_sys_drag.clear_start = true;
			with(obj_sys_drag) event_user(0);
		}
		else //合算値がmaxを超えるなら
		{
			//追加先のamountをmaxに、追加元のamountをその差に。
			inventory_amount[select_inv_x, select_inv_y] = to_amount_max;
			var amount_diff = sum_amount - to_amount_max;
			obj_sys_drag.creator.inventory_amount[obj_sys_drag.drag_inv_x, obj_sys_drag.drag_inv_y] = amount_diff;
		}
	}
	
	//drag中にマウスを離し、かつcan_dropなら
	if(instance_exists(obj_sys_drag) == true) and (can_drop == true) //drop成功
	{
		//クリアフラグ：元居た場所のid消去
		obj_sys_drag.clear_start = true;
		with(obj_sys_drag) event_user(0);
		
		//新たな位置の編集をスタート
		with(obj_sys_drag)
		{
			edit_to = other;
			event_user(2); 
		}
	}
	can_drop	= false;
	can_stack	= false;
	mode_click	= false;
	mode_drag	= false;
}
#endregion

#region //can_move

if(can_move == true)
{
	//元居た場所のid消去
	var dd_x = click_inv_x;
	var dd_y = click_inv_y;
	var dd_w = click_inv_x + click_inv_w;
	var dd_h = click_inv_y + click_inv_h;
	while(dd_y < dd_h)
	{
		inventory		 [dd_x,dd_y] = 0;
		inventory_lump	 [dd_x,dd_y] = 0;
		inventory_amount [dd_x,dd_y] = 1;
		inventory_sprite [dd_x,dd_y] = 0;
		dd_x += 1;
		if(dd_x >= dd_w)
		{
			dd_x = click_inv_x;
			dd_y += 1;
		}
	}
	//スタック走査の結果、まだclick_amountが0になっていないなら
	if(click_amount > 0)
	{
		//移動先のインベントリを更新
		with(moveto)
		{
			//新たな位置にlump登録と仮ID1を登録
			var dd_x = other.go_x;
			var dd_y = other.go_y;
			var dd_w = other.go_x + other.click_inv_w;
			var dd_h = other.go_y + other.click_inv_h;
			global.inv_lump_number += 1;
			while(dd_y < dd_h)
			{
				inventory		[dd_x,dd_y] = 1;
				inventory_lump	[dd_x,dd_y] = global.inv_lump_number;
				dd_x += 1;
				if(dd_x >= dd_w)
				{
					dd_x = other.go_x;
					dd_y += 1;
				}
			}
			//新たな位置にitem ID, amount, spriteを登録
			inventory		 [other.go_x, other.go_y] = other.click_id;
			inventory_amount [other.go_x, other.go_y] = other.click_amount;
			inventory_sprite [other.go_x, other.go_y] = asset_get_index(obj_sys_manager.file_csv_item[# 2,other.click_id]);	
		}
	}
	moveto = noone;
	can_move = false;
}

#endregion

#region //売却ボタン

//total_priceが0では売れない
if(total_price > 0)
{
	can_deal = true;
}
else
{
	can_deal = false;
}

//ボタンの位置とサイズを決定

var dmx	= device_mouse_x_to_gui(0);
var dmy	= device_mouse_y_to_gui(0);

if(can_deal == true) and (point_in_rectangle(dmx,dmy,tradeb_x,tradeb_y,tradeb_x + tradeb_w,tradeb_y + tradeb_h))
{
	tradeb_alpha = 1;
	if(mouse_check_button(mb_left)) and (can_press == true)
	{
		if (press_time < duration)
		{
			press_counter = scr_ease_in_out(press_time, start, dest - start, duration);
			press_time++;
		}
		else
		{
			press_counter = 0;
			can_press = false;
			event_user(1);
		}
	}
	else
	{
		press_counter = floor(press_counter / 1.4);
		press_time = press_counter;
	}
}
else
{
	tradeb_alpha = 0.5;
	press_counter = floor(press_counter / 1.4);
	press_time = press_counter;
}

if(mouse_check_button_released(mb_left)) //マウス離したらカウント終了
{
	can_press = true;
	press_counter = floor(press_counter / 1.4);
	press_time = press_counter;
}

#endregion