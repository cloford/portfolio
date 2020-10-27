/// @desc 操作入力

#region 死亡時
if(dead == true)
{
	if(keyboard_check_pressed(vk_enter))
	{
		room_goto(rm_hideout);
	}
	return;
}
#endregion

#region //操作入力
#region コントロール
if (hascontrol == true)
{
	key_left		= keyboard_check(ord("A"));
	key_right		= keyboard_check(ord("D"));
	key_up			= keyboard_check(ord("W"));
	key_down		= keyboard_check(ord("S"));
	key_shot		= mouse_check_button(mb_left);
	active_key_slot[0]	= keyboard_check_pressed(ord("1"));
	active_key_slot[1]	= keyboard_check_pressed(ord("2"));
	active_key_slot[2]	= keyboard_check_pressed(ord("3"));
	active_key_slot[3]	= keyboard_check_pressed(ord("4"));
	active_key_slot[4]	= keyboard_check_pressed(ord("5"));
	active_key_slot[5]	= keyboard_check_pressed(ord("6"));
	active_key_slot[6]	= keyboard_check_pressed(ord("7"));
	active_key_slot[7]	= keyboard_check_pressed(ord("8"));
}
else
{
	key_left		= false;
	key_right		= false;
	key_up			= false;
	key_down		= false;
	key_shot		= false;
	active_key_slot[0]	= false;
	active_key_slot[1]	= false;
	active_key_slot[2]	= false;
	active_key_slot[3]	= false;
	active_key_slot[4]	= false;
	active_key_slot[5]	= false;
	active_key_slot[6]	= false;
	active_key_slot[7]	= false;
}

key_inventory	= keyboard_check_pressed(vk_tab);
key_intract		= keyboard_check_pressed(ord("F"));

#endregion

#region //インベントリを開く／閉じる
if (key_inventory == true) 
{
	if (open_inventory == false) //インベントリを開く
	{
		hascontrol = false;
		event_user(1); //open_inventory
	}
	else //インベントリを閉じる
	{
		hascontrol = true;
		open_inventory = false;
		instance_destroy(obj_sys_inventory);
		instance_destroy(obj_sys_equipment);
	}
}

if(intract_to != noone) and (key_intract == true)
{
	open_inventory = false;
	hascontrol = true;
	intract_to = noone;
	key_intract = false;
	instance_destroy(obj_sys_inventory);
	instance_destroy(obj_sys_equipment);
}
#endregion

#region //スキルをアクティブ・トグルなど

for(var i = 0; i < slot_height; i += 1)
{
	if(active_key_slot[i] == true) and (active_type[i] != 0)
	{
		audio_play_sound(se_footstep,50,false);
		switch(active_type[i])
		{
			case "hand":
			holding_slot = i;
			break;
			
			case "toggle_a":
			active_type[i] = "toggle_d";
			break;
			
			case "toggle_d":
			active_type[i] = "toggle_a";
			break;
			
			case "active":
			//アクティブスタックが1以上なら実行
			if(active_stack[i,1] >= 1)
			{
				active_stack[i,1] -= 1;
				var inst = instance_create_layer(x,y,layer,skill_object[i]);
				inst.creator = id;
				with(inst) event_user(0);
			}
			break;
		}
	}
}

#endregion

#endregion

#region //状態
neck_direction = direction;
#endregion