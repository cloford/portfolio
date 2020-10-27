/// @description 行動

#region 視界
//なし
#endregion

#region 聴覚
hearing = scr_sound_load(hearing_power);
if(hearing > 1) and (ai_mode < 40) //少しでも音が聞こえたら
{
	ai_mode = 3;
}
#endregion

#region AI

switch(ai_mode)
{
	case 0: //ai_mode 未定義
		break;
	
	case 1:		//アイドルモード
		//なにもしない
		break;
	
	case 3:		//何か音を聞いた
		scr_enemy_check_to_point(from_sound_point_x, from_sound_point_y, 50);
		break;
	
	case 50:	//敵を発見、攻撃
		fire_now = true;
		ai_mode = 1;
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