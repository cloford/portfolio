///スロットの上から順に、CD・Firerateが解消されている装備を選び、撃つ。

//射撃命令が出ているならcastできるかチェック
if(fire_now == true)
{
	//射撃命令が出たとき、射撃できる状態ならcasting状態に移行する。
	var hold_rifle	= (equip_type[holding_slot] == "rifle");	//ライフルを構えているか
	var act_stack	= (active_stack[holding_slot, 1] >= 1);		//アクティブスタックが1以上あるか
	var up_f_rate	= (firerate[holding_slot, 1] == 0)			//firerateはあがってるか
	var not_casting = (casting == false)						//すでにcast中ではないか

	if(hold_rifle) and (act_stack) and (up_f_rate) and (not_casting)
	{
		//このとき狙った位置を記録
		if(object_index == obj_player)  //playerの場合はマウスxy
		{
			cast_point_x = mouse_x;
			cast_point_y = mouse_y;
		}
		else //それ以外なら、playerの位置xy（暫定）
		{
			cast_point_x = obj_player.x;
			cast_point_y = obj_player.y - (obj_player.sprite_height / 2);
		}
		cast_count = cast_time[holding_slot];
		casting = true;
	}
}

fire_now = false; //どんな状態であれ、fire_nowはそのフレーム中にfalseに戻る。

//casting状態なら、移動などを停止し、cast_countが0になれば詠唱成功->弾発射
if(casting == true)
{
	//警告を表示。警告objectを生成する。
	if(cast_start_check == false) //一度だけ実行
	{
		cast_start_check = true;
		firerate[holding_slot, 1] = firerate[holding_slot, 0];
		active_stack[holding_slot, 1] -= 1;
		energy -= slot_need_energy[holding_slot]; 
		mybullet				= instance_create_layer(x, y - (sprite_height / 2), layer, attack_type[holding_slot]);
		mybullet.creator		= id;
		mybullet.team			= team;
		damage_type				= "normal";
		mybullet.cast_time		= cast_time		[holding_slot];
		mybullet.skill_range	= skill_range	[holding_slot];
		mybullet.damage			= bullet_damage	[holding_slot];
		mybullet.bullet_speed	= bullet_speed	[holding_slot];
		mybullet.direction		= point_direction(x, y - (sprite_height / 2), cast_point_x, cast_point_y)
		mybullet.image_angle = mybullet.direction;
		with(mybullet) event_user(0);

	}
	hascontrol = false;
	speed = 0;
	cast_count -= 1;
	if(cast_count <= 0)
	{
		casting = false;
		cast_start_check = false;
		hascontrol = true;
	}
}


//TODO 装備スロットを押すと「装備を構えて」、shotキーで「構えている装備を」撃つ

//実体
			