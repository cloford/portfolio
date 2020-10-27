//マウス関連
cursor_sprite = spr_mouse;
window_set_cursor(cr_none);

//アイテムcsv
file_csv_item			= load_csv("Items.csv");
file_csv_item_shields	= load_csv("item_shields.csv");
file_csv_item_rifles	= load_csv("item_rifles.csv");
file_csv_item_active	= load_csv("item_active_skill.csv");

global.shield_id_offset	= 50;	//シールドcsvのID列オフセット
global.rifle_id_offset	= 70;	//同上
global.active_id_offset	= 90;	//同上

//音
audio_falloff_set_model(audio_falloff_linear_distance_clamped); //音量減衰線形モデル。これはライナー。
audio_listener_orientation(0, 0, 1000, 0, -1, 0); //リスナーの向き（画面に対するものと考えてよい）を2Dゲーム向けに。

//TODO global変数へ移す

//dfile_csv_enemy_stat		= load_csv("enemys.csv");

//TODO randomizeで乱数の初期seed値をランダムにする（真のランダム化）
//リリース時にコメントアウトすること。
//randomize();