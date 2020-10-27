//@desc いじる

if(init_end == false) return;

//アルゴリズム
//クリックすると購入予定アイテムがbuy属性を持ってshopcartのsys_inventoryに送られる
//購入ボタンを押せば、buy属性が消える
//購入ボタンを押すか、roomを出るか、gameを終えるとhideoutのinventoryが更新される。buy属性がついている部分は0扱いになる。

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
	
	if(tsi_x < inv_width) and (tsi_y < inv_height)
	{
		//選択したマスの格納idが1の場合は、lumpチェックし左上原点を選択したとみなす。
		if(inventory[tsi_x,tsi_y] == 1) and (instance_exists(obj_sys_drag) == false)
		{
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

//何かがdragされてきたら、それがなんであれcan_dropはfalse
if(select_inv_x >= 0) and (instance_exists(obj_sys_drag))
{
	select_inv_w = obj_sys_drag.drag_inv_w;
	select_inv_h = obj_sys_drag.drag_inv_h;
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
		if(keyboard_check(vk_shift) == true) click_amount = real(obj_sys_manager.file_csv_item[# 6,click_id]);
		else click_amount = 1;
		try_buy_amount = click_amount;
	}
}

#endregion

#region //release
if(mouse_check_button_released(mb_left))
{
	//商品をクリックした
	if(instance_exists(obj_sys_drag) == false) and (mode_click == true)
	{
		var to_max_amount = real(obj_sys_manager.file_csv_item[# 6,click_id]);
		
		//スタックできる相手がいなくなるまで走査shop版
		scr_item_stack_check_shop(to_max_amount);
		
		//空きマス走査開始。成功したらcan_move
		scr_item_can_move_check(click_inv_w, click_inv_h);
		
		if(can_move == false) //購入できないなら、tryした数をチェック
		{
			try_buy_amount -= click_amount; //実際にスタックできた数（0～max）
		}
		
		//購入金額をtotal_priceに追加
		if(try_buy_amount != 0)
		{
			total_price += (try_buy_amount * real(obj_sys_manager.file_csv_item[# 3,click_id]));
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
			inventory_buy	 [other.go_x, other.go_y] = true;
		}
	}
	can_move = false;
}

#endregion

#region //所持金チェック

//購入金額が所持金以下で、かつ0ではないならcan_deal
if(obj_rm_hideout.money >= total_price) and (total_price > 0)
{
	can_deal = true;
}
else
{
	can_deal = false;
}

#endregion

#region //購入ボタン


//ボタンの位置とサイズを決定
var dmx	= device_mouse_x_to_gui(0);
var dmy	= device_mouse_y_to_gui(0);

if(point_in_rectangle(dmx,dmy,tradeb_x,tradeb_y,tradeb_x + tradeb_w,tradeb_y + tradeb_h)) and (can_deal == true)
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
			event_user(1); //trade成功
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

if(mouse_check_button_released(mb_left)) //マウス離したらカウント中断
{
	can_press = true;
	press_counter = floor(press_counter / 1.4);
	press_time = press_counter;
}

#endregion
