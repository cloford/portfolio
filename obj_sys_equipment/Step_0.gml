/// @description 


if(init_end == false) return;

var dmxg = device_mouse_x_to_gui(0);
var dmyg = device_mouse_y_to_gui(0);

#region //select
select_equip = -1;
var ix = slot_x_int;

var iy = 0;
for (var i = 0; i < 8; i += 1)
{
	if(point_in_circle(dmxg, dmyg, x_buffer + ix, y_buffer + (iy * slot_y_int), slot_radius))
	{
		select_equip = i;
	}
	iy += 1;
	ix *= -1;
}
#endregion

#region //click
if (mouse_check_button_pressed(mb_left))
{
	//equipment click
	if(select_equip != -1)
	{
		if(equipment_slot[select_equip] != 0)
		{
			mode_click = true;
			click_equip = select_equip;					//クリックしたスロット
			click_id = equipment_slot[click_equip];		//itemID登録
			mouse_grab_x = (dmxg);
			mouse_grab_y = (dmyg);
		}
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
			mydrag.from_equip = true;
			with(mydrag) event_user(1); //変数を定義
		}
	}
}

#endregion

#region //release
if(mouse_check_button_released(mb_left))
{
	if(instance_exists(obj_sys_drag) == true) and (select_equip != -1) //ドラッグ中かつスロットが選択されていたなら
	{
		if(obj_sys_drag.from_equip == true)	//------装備スロットから装備スロットへ
		{
			//itemIDを入れ替え
			var tempID = equipment_slot[select_equip];
			equipment_slot[select_equip] = obj_sys_drag.drag_item;
			obj_sys_drag.creator.equipment_slot[obj_sys_drag.drag_ID] = tempID;
			//updateフラグ
			slot_update[select_equip] = true;
			obj_sys_drag.creator.slot_update[obj_sys_drag.drag_ID] = true;
		}
		else								//------インベントリから装備スロットへ
		{
			//TODO: 装備できないものは入らない
			if(equipment_slot[select_equip] == 0) //空いてないなら無理
			{
				equipment_slot[select_equip] = obj_sys_drag.drag_item;
				slot_update[select_equip] = true; //update
				obj_sys_drag.clear_start = true;
				with(obj_sys_drag) event_user(0);
			}
		}
	}
	//surface reset
	surface_free(equipment_surf);
	mode_click = false;
	mode_drag = false;
}
#endregion

#region //equipment updateチェック。obj_playerの装備スロットを更新したなら、即更新する。
if(creator.object_index == obj_player_backpack)
{
	for(var i = 0; i < slot_height; i += 1)
	{
		if(slot_update[i] == true)
		{
			need_update = true;
		}
	}
	if(need_update == true)
	{
		audio_play_sound(se_door_open,50,false);
		creator.equipment_slot	= equipment_slot;
		creator.slot_update		= slot_update;
		with(creator) event_user(1);
		for(var i = 0; i < slot_height; i += 1)
		{
			slot_update[i] = false;
		}
		need_update = false;
	}
}

#endregion