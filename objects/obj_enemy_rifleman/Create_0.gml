///@desc 初期値

#region 基本ステータス

//耐久力
hit_point_cap = 10;			//耐久力最大値
hit_point = hit_point_cap;	//耐久力

//移動スピード
walk_speed_init	= 3;
walk_speed = walk_speed_init;

//視力
eyesight_near	= 320;

//聴力
hearing_power	= 1;

//電力システム
energy_cap			= 800;			//最大充電量
energy				= energy_cap;	//電力
energy_charge_speed	= 1;			//電力充電速度

//所属
team			= "team_red";

#endregion

#region // AI
//TODO パスの行き先変数の統一

ai_mode = 1; //デフォルトのai_mode
#region アイドル時の行動

next_move_point_x = 0;
next_move_point_y = 0;

idle_angle = 0;
idle_count = 0;
idle_time = 300; //何秒ごとに周りを見るか
idle_direction_check = false;

#endregion

#region //あるポイントまで移動・確認
checking_path = path_add(); //確認する地点までのパスインデックス
count = 0;				//動かしたフレーム数（計算用）
check_flag = false;		//終端にたどり着いた時の角度を保存する際に一度だけ使うスイッチ

set_direction = 0;		//終端にたどり着いたときにobjが向いている角度

neck_speed = 60;		//首を振り向かせる速度
turning_around = 90;	//首が回る角度

point_memory_x = 0;
point_memory_y = 0;
#endregion

#endregion

#region //light

mylight = instance_create_layer(global.outer_world,global.outer_world,"lay_light",obj_light_actor_spot);
mylight.creator = id;

#endregion

//parent_actorのコードをロード
event_perform_object(obj_parent_actor,ev_create,0);


//========debug