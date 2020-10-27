/// @description 変数説明

press_counter	= 0;		//プレス操作カウンター
move_start		= false;	//移動開始確認変数

start = press_counter;
dest = press_counter + sprite_width;
duration = obj_sys_manager.duration;
press_time = 0;

draw_alpha		= 0.5;		//選択／非選択時のalpha値