/// @description 行動

#region 視界
if(ai_mode < 30)
{
	scr_enemy_eye_angle(20, 19);
}
#endregion

#region 聴覚
hearing = scr_sound_load(hearing_power);
if(hearing > 1) and (ai_mode <= 20) //少しでも音が聞こえたら
{
	ai_mode = 10;
}
#endregion

#region AI

switch(ai_mode)
{
	case 0: //ai_mode 未定義
		break;
	
	case 1:		//アイドルモード >>20
		scr_ai_idle_kyorokyoro();
		
		break;
		
	case 10:	//音声確認モード
		scr_ai_lookpoint(from_sound_point_x,from_sound_point_y,1);
		break;
		
	case 19:	//構え解き処理
		iai_count = 0;
		ai_mode = 1;
		break;
	
	case 20:	//構えモード >>30
		iai_count += 1;
		var to_dir = point_direction(x, (y - eye_y), target.x, target.y - (target.sprite_height /2) );
		var diff = angle_difference(to_dir, neck_direction);
		neck_direction += (min(abs(diff / 10), 10) * sign(diff));
		//敵の方向を見てカウントを開始する
		if(iai_count >= 60)
		{
			memory_x = target.x;
			memory_y = target.y;
			ai_mode = 30;
			iai_count = 0;
		}
		break;
	
	case 30:		//敵の場所まで移動
		//	scr_enemy_check_to_point(target.x,target.y,50);
		if(point_distance(x,y,memory_x,memory_y) > 100)
		{
			x_speed = lengthdir_x(point_distance(x,y,memory_x,memory_y),neck_direction) / 10;
			y_speed = lengthdir_y(point_distance(x,y,memory_x,memory_y),neck_direction) / 10;
		}
		else 
		{
			ai_mode = 50;
		}
		break;
	
	case 50:	//攻撃
		fire_now = true;
		ai_mode = 51;
		break;
		
	case 51:	//攻撃後
		iai_count += 1;
		if(iai_count >= 120)
		{
			iai_count = 0;
			ai_mode = 1;
		}
}


#endregion

#region 移動、座標更新

scr_actor_move(x_speed, y_speed); //衝突判定及び移動
x_speed = 0;
y_speed = 0;

//エミッター（音声の出力者）の位置を同期する。
audio_emitter_position(myemitter, x, y, 0);

#endregion

#region 電力システム

energy = min(energy + energy_charge_speed, energy_cap); //energyを毎フレーム充電

#endregion

#region //Skill

//cooldown 各スロットのCDを一律1ずつ下げる。
scr_cooldown();

//bullet衝突チェック
scr_actor_noshield();

//damageチェック
scr_body_damage();

//ライフルを撃つ
scr_fire_now();
#endregion

#region 状態異常

//移動中は床の下にいるから影響受けないでしょｊｋ
//scr_actor_effect();

#endregion



