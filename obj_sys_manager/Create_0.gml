//部屋移動関連
roommove_to = noone;

//テキストボックス関連
draw_set_font(fnt_text);

box_to_top = false;
msgcol_o = c_white;
msgcol_i = make_color_rgb(24,24,24);
box_ut = window_get_height()-32-208; //32はバッファ量、208はウィンドウサイズ。変数にした方が後々よい

//プレスボタン関係

duration = 45; //ボタンを押す長さ
careful_duration = duration * 1.5; //重要なボタンを押す長さ

#region //Global関数

//GUI


//カラーパレット
global.color_ui_dg = make_color_rgb(24,24,24);


//アイテム関係
global.inv_box_size = 64;		//インベントリのマスサイズ
global.inv_lump_number = 0;		//itemのlumpナンバー

//システムobject配置位置
global.outer_world = -800;		//画面外左上800へ

//サウンド
global.se_priority = 50;

#endregion