if(draw_check == true)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_red);
	draw_rectangle(menu_x - 190,150,menu_x + 190,menu_y+160,false);//大きめ固定のサイズ（要相談）
	draw_set_color(c_white);
	draw_rectangle(menu_x - 180,160,menu_x + 180,menu_y+150,false);//大きめ固定のサイズ（要相談）
	switch(menu_depth)
	{
		case 1:
		for(count1 = 0; count1 < menu_items; count1++) //menu[]のサイズ3だけループして一番したのdrawtで表示する,今回だと0.1.2があるので4回目でループが閉じる
		{
		//	var offset = 2; //文字に外枠をつけたりしたい場合はoffset分を足して表示する
			var txt = menu[count1]; //現在のループ回数の内容"countinue"や"Quit"などをtxtに入れる（選択されている文字列の処理）
			if ((point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),menu_x - 190,click_rect_y[count1]-12,menu_x + 190,click_rect_y[count1]+12)) == true )
			//もしmenu_cursorが現在のループ回数と同じであれば現在のtxtに入っている"continue"などの文字列の-1の位置に">"を挿入する
			{
				menu_cursor = count1;
				txt = string_insert("> ",txt, -1);
				var col = c_blue;//選択されている文字を白くする
			}
			else//選択されていない文字列の処理
			{
				var col = c_gray;
			}
			//ここから下が表示の本体、ここから上は配列操作と色の設定
			var xx = menu_x;
			//menu_x = display_get_gui_width();
			var yy = menu_y - (menu_itemheight * (count1 * 1.5));
			//menu_y = gui_height / 2;
			//menu_itemheight = font_get_size(menu_font);
			// yy = 512 - 24 * (現在選ばれてるmenu[0~2]の順番1~3 * 1.5);
	
			//	draw_set_color(c_blue);　//offset分のカラーを表示
			//	draw_text(xx - offset,yy,txt);
			//	draw_text(xx + offset,yy,txt);
			//	draw_text(xx,yy - offset,txt);
			//	draw_text(xx,yy + offset,txt);
			draw_set_color(col);
			draw_text(xx,yy,txt);
			click_rect_y[count1] = yy;
		}
		break;
						
		case 2:
		for(count1 = 0; count1 < menu_option_size; count1++) //menu[]のサイズ3だけループして一番したのdrawtで表示する,今回だと0.1.2があるので4回目でループが閉じる
		{
			var txt = menu_option[count1]; 
			if ((point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),menu_x - 190,click_rect_y[count1]-12,menu_x + 190,click_rect_y[count1]+12)) == true )
			{
				menu_cursor = count1;
					
				txt = string_insert("> ",txt, -1);
				var col = c_blue;
			}
			else//選択されていない文字列の処理
			{
				var col = c_gray;
			}
			var xx = menu_x;
			var yy = menu_y - (menu_itemheight * (count1 * 1.5));
			draw_set_color(col);
			draw_text(xx,yy,txt);
			click_rect_y[count1] = yy;
		}
		break;
	}
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}
/*
			for(var i = 0; i < menu_option_size; i++) //menu[]のサイズだけループして一番したのdraw_textで表示する,今回だと0.1.2があるので4回目でループが閉じる
			{
				var txt = menu_option[i]; //現在のループ回数の内容"countinue"や"Quit"などをtxtに入れる（選択されている文字列の処理）
				if (menu_cursor == i) //もしmenu_cursorが現在のループ回数と同じであれば現在のtxtに入っている"continue"などの文字列の-1の位置に">"を挿入する
				{
					txt = string_insert("> ",txt, -1);
					var col = c_blue;
				}
				else//選択されていない文字列の処理
				{
					var col = c_gray;
				}
				//ここ以下が表示の本体、これから上は配列操作と色の設定
				var xx = menu_x;
				var yy = menu_y - (menu_itemheight * (i * 1.5));
				draw_set_color(col); 
				draw_text(xx,yy,txt);
			}

			break;
*/
