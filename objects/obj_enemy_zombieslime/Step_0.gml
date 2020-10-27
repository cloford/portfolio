/// @description 行動

#region 視界
scr_enemy_eye_circle(50, 40);
#endregion

#region 聴覚
//なし
#endregion

#region AI

switch(ai_mode)
{
	case 0: //ai_mode 未定義
		break;
	
	case 1:		//アイドルモード
		//なにもしない
		break;
		
	case 40:	//targetを見失った
		if(path_position == 1)
		{
			if(path_get_number(checking_path) >= 1) path_clear_points(checking_path);
			ai_mode = 1;
		}
		break;
	
	case 50:	//targetを発見、その位置まで移動
		scr_enemy_check_to_point(target.x, target.y, 40);
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

#region //Skill

//targetとの衝突チェック
//衝突したなら、1点ダメージを与えて自爆
var inst = instance_place(x,y,target);
if(inst != noone)
{
	inst.damage = 1;
	instance_destroy();
}


//bullet衝突チェック
scr_actor_noshield();

//damageチェック
scr_body_damage();

#endregion

#region 状態異常

scr_actor_effect();

#endregion