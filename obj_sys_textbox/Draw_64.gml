

#region //選択モード

if (choice_mode)
{
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,window_get_width(),window_get_height(),false);
	draw_set_alpha(1);

	for (var i = 0; i < choice_items; i++) //choice_itemsと同じ数だけ{}を繰り返す
	{
		var txt = choice[question_flag,i]; //choiceID通りのテキストをtxt変数に格納
		if (choice_cursor == i) //カーソルに選ばれたか？
		{
			var col = c_white; //col変数は色。カーソルで選んだところは白
		}
		else
		{
			var col = c_gray; //カーソルに選ばれていない文字はグレー
		}
		var wcx = window_get_width() / choice_items;
		var xx = (wcx * (i+1)) - (wcx / 2);
		var yy = (window_get_height()-240)*0.5;
		draw_set_color(col); //テキスト本体色
		draw_set_halign(fa_center); //中央揃え
		draw_text(xx,yy,txt); //テキスト本体
	}
}

//TODO: 天地中央を正しく。セリフの特別処理を追加。背景画像「嘘」とか追加。選択中の選択肢背景強調

#endregion

box_ut = obj_sys_manager.box_ut; //boxを上下どちらに置くか。現在値を参照

//テキストボックスを描画
draw_set_alpha(0.8);
draw_set_color(obj_sys_manager.msgcol_o); //msg_col_oはアウトライン（枠線）と本文の色
draw_rectangle(box_x,box_y+box_ut,boxwidth,boxHeight+box_ut,false);
gpu_set_blendmode_ext(bm_zero,bm_subtract);
draw_set_color(obj_sys_manager.msgcol_i);//msg_col_iは塗りの色
draw_rectangle(box_x+2,box_y+box_ut+2,boxwidth-2,boxHeight+box_ut-2,false);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1)

draw_set_font(fnt_text); //テキストのフォント決定

//配列を2つだけ作っている状態で3ページ目に行くと配列の範囲外になってエラーを吐く
//draw_text_ext(x,y,text[page],stringHeight,boxwidth);

if (charCount < string_length(text[c_flag,page]))
{
	charCount += 0.3;//文字のカウント、0.5だと2フレームに1文字描写する
}
else
{
	charCount = string_length(text[c_flag,page])
}

textPart = string_copy(text[c_flag,page], 1,charCount);//現時点で表示している文字数

draw_set_color(obj_sys_manager.msgcol_o); //本文テキスト色決定
draw_set_halign(fa_left); //左揃え
//テキスト本文のボックス
draw_text_ext(box_x+xBuffer,box_y-3+box_ut+yBuffer,textPart,stringHeight,boxwidth-xBuffer*3);
//TODO: 本文のサイズ決定、テキストボックスの高さを決定（テキスト本文boxがはみでないように）