
if(menu_control) //menu_controlが1ならば実行 set 0 in create.
	{
		//obj_sys_debug.debug1 = menu_cursor;
		if(keyboard_check_pressed(vk_up)) 
			{
				menu_cursor += 1;//menu_cursor　set 2 in create.
		//上を押すとカーソルがプラスされていく
					if(menu_cursor >= menu_items) //カーソルが項目のサイズ(3)を超えた場合カーソルを0（一番下）にカーソルの値を入れる
					{
						menu_cursor = 0;
					}
			}
		if(keyboard_check_pressed(vk_down))
			{
				menu_cursor -= 1;//menu_cursor set 2 in create.
				//↓を押すとカーソルがマイナスされていく
					if(menu_cursor < 0) //カーソルの値がマイナスになった場合項目サイズ(3)から1を減らした一番上にカーソルの値を入れる
						{
							menu_cursor = menu_items - 1;
						}
			}
		if(keyboard_check_pressed(vk_enter))
			{
				menu_committed = menu_cursor;//menu_comittedにカーソルの現在値が入る
			}
		if(keyboard_check(vk_escape))
			{
				draw_check = false;
				obj_player.hascontrol = true;//プレイヤーのコントロールを復活させる
				menu_control = 0;//menu操作をfalseにして操作不能にする
				menu_committed = -1;//選択肢から選んだ値を元に戻す
				menu_cursor = 2;//カーソルをデフォルトの位置へ戻す
			}
		
	}