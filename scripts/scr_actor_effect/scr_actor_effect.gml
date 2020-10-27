//自身に関連のあるエフェクトが付与される床に乗った時の挙動

#region 接着床
if(effect_glue != noone) 
{
	if(glue_time >0)
	{
		walk_speed = walk_speed_init * glue_power;
		glue_time -= 1;
	}
	else
	{
		effect_glue = noone;
		walk_speed = walk_speed_init;
	}
	path_speed = walk_speed;
}

#endregion 

#region 風床
if(effect_blow != noone)
{
	path_end();
	//移動方向の計算
	blow_move_x = lengthdir_x(effect_blow.blow_power,effect_blow.blow_direction);
	blow_move_y = lengthdir_y(effect_blow.blow_power,effect_blow.blow_direction);
	
#region 移動先が壁にぶつかったときの処理
	if(place_free(x + blow_move_x,y) == false)
	{
		while(place_free(x + sign(blow_move_x),y))
		{
			x = x + sign(blow_move_x)
		}
		blow_move_x = 0;
	}
	
	if(place_free(x,y + blow_move_y) == false)
	{
		while(place_free(x,y + sign(blow_move_y)))
		{
			y = y + sign(blow_move_y)
		}
		blow_move_y = 0;
	}
#endregion

	x = x + blow_move_x;
	y = y + blow_move_y;
	
	//風の影響が無くなったら終了して止まっていたパスを開始する
	if(effect_blow.blow_count>= effect_blow.blow_time + effect_blow.blow_move_time -1)
	{
		effect_blow = noone;
		if(object_index != obj_player)
		{
			mp_grid_path(obj_sys_tracer.grid,checking_path,x,y,point_memory_x,point_memory_y,true);
			path_start(checking_path,walk_speed,path_action_stop,false);
		}
	}
}

#endregion 