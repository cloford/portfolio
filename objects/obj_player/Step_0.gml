///@desc 移動など

#region //方向

player_angle = point_direction(x,y - (sprite_height / 2),mouse_x,mouse_y);
	switch (player_angle div 90)
	{
		case 0: image_index = 0; break;
		case 1: image_index = 1; break;
		case 2: image_index = 2; break;
		case 3: image_index = 3; break;
	}
#endregion

#region //移動

//移動入力確認
player_magnitude = (key_right - key_left != 0) || (key_down - key_up != 0);
if (player_magnitude = 1)//ボタンを押しているのならばdirectionを変更する
{
	move_direction = point_direction (0,0,key_right - key_left,key_down - key_up);	
}

//実際の移動先座標への距離決定
x_speed = lengthdir_x (player_magnitude * walk_speed,move_direction);
y_speed = lengthdir_y (player_magnitude * walk_speed,move_direction);

scr_actor_move(x_speed, y_speed); //衝突判定及び移動

//リスナー（3D音声の視聴者主体）の位置を同期する。
audio_listener_position(x, y, 0);

//エミッター（音声の出力者）の位置を同期する。
audio_emitter_position(myemitter, x, y, 0);

#endregion

#region //カメラに対する座標
//即ち、画面上の絶対座標
var dmx = device_mouse_x_to_gui(0);
var dmy = device_mouse_y_to_gui(0);
display_x = -((dmx / global.gui_w * (global.gui_w / 3)) - (global.gui_w / 1.5));
display_y = -((dmy / global.gui_h * (global.gui_h / 3)) - (global.gui_h / 1.5)) - (sprite_height / 2);


#endregion

#region 音の発生(デバッグ用)

if(keyboard_check_pressed(ord("R")))
{
	scr_sound_save(1200, id, "alert",x,y);
	audio_play_sound_on(myemitter, se_excrametion, false, global.se_priority); //SE再生
}

#endregion 

#region //電力システム

energy = min(energy + energy_charge_speed, energy_cap); //energyを毎フレーム充電

#endregion

#region //装備の処理

//cooldown
if(fetus == false)
{
	scr_cooldown(); 
}

//自動シールド処理（bulletに触れた時）
scr_passive_shield();

//bulletが本体に触れたかチェック
scr_body_damage();


//ライフルを撃つ
fire_now = key_shot;
direction = player_angle; //TODO多分上のplayer_angleはdierctionにしていい
scr_fire_now();

#endregion

#region 状態異常

scr_actor_effect();

#endregion