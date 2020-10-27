/// @description 行動

#region 視界
scr_enemy_eye_angle(50, 40);
#endregion

#region 聴覚
hearing = scr_sound_load(hearing_power);
if(hearing > 1) and (ai_mode < 40) //少しでも音が聞こえたら
{
	ai_mode = 3;
}
if(hearing > 1) and ((ai_mode == 40)or(ai_mode == 42))//探索モード時に音が聞こえた場合の処理
{
	//何度音が鳴ってもロストポイントの確認を必ず優先する
	ai_mode = 41;
}

#endregion

#region AI

switch(ai_mode)
{
	case 0: //ai_mode 未定義
		break;
	
	case 1:		//アイドルモード
		scr_ai_idle_urouro();
		//scr_idle_set_area();
		break;
	
	case 3:		//何か音を聞いた
		scr_ai_lookpoint(from_sound_point_x, from_sound_point_y, 1);
		break;
		
	case 30:	//敵を完全に見失った
		scr_ai_kubihuri(1);
		break;
		
	case 40:	//敵を見失った
		scr_enemy_check_to_point(target.x, target.y, 30);
		break;
		
	case 41:	//敵を見失った後に音を聞いた場合、そちらを確認する
		scr_ai_lookpoint(from_sound_point_x, from_sound_point_y,42);
		break;
	case 42:	//音の場所を確認した後、最初に見失ったポイントまで移動する
		scr_enemy_check_to_point(point_memory_x,point_memory_y,30);
		break;

	case 50:	//敵を発見、攻撃
		scr_ai_attack_keep_dist();
		break;
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

//パッシブシールド処理（bulletに触れた時）
scr_passive_shield();

//bulletが本体に触れたかチェック
scr_body_damage();

//ライフルを撃つ
scr_fire_now();
#endregion

#region 状態異常

scr_actor_effect();

#endregion
